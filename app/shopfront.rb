require 'sinatra/base'
require 'sinatra/cookies'
require 'JSON'
require 'URI'
require_relative 'models/product'

class Shopfront < Sinatra::Base
  ENV["RACK_ENV"] ||= "development"
  helpers Sinatra::Cookies

  get '/' do
    @products = filter(cookies[:gender])
    @basket_count = cookies[:basket] ? parse_basket.count : 0
    erb :'index'
  end

  post '/filter' do
    cookies[:gender] = params[:gender]
    redirect '/'
  end

  post '/buy' do
    cookies[:basket] ||= JSON.dump([])
    add_to_basket(params[:product_id])
    redirect '/'
  end

  post '/discard' do
    remove_from_basket(params[:product_id])
    redirect '/basket'
  end

  post '/voucher' do
    cookies[:voucher] = params[:voucher]
    redirect '/basket'
  end

  get '/basket' do
    @basket_contents = parse_basket
    @products = Product.all
    @total_cost = sum_basket(@basket_contents)
    handle_vouchers
    erb :'basket'
  end


  helpers do

    def handle_vouchers
      total_cost = sum_basket(parse_basket)
      original_cost = total_cost
      @total_cost = apply_vouchers(total_cost, parse_basket, cookies[:voucher])
      voucher_effective?(original_cost, @total_cost, cookies[:voucher])
      @total_cost = format_pounds(@total_cost)
      cookies[:voucher] = ""
    end


    def filter(letter)
      if letter == "W"
        return Product.all(gender: 'Women\'s')
      elsif letter == "M"
        return Product.all(gender: 'Men\'s')
      else
        return Product.all
      end
    end

    def voucher_effective?(original_cost, total_cost, voucher)
      if original_cost == @total_cost && exists?(voucher)
        @error_message = "Voucher not valid"
      else
        @error_message = nil
      end
      if original_cost != @total_cost
        @voucher_used = true
      end
    end

    def apply_vouchers(total_cost, items, voucher)
      five_pounds_off?(voucher) ? total_cost -= 500 : nil
      ten_pounds_off?(voucher, total_cost) ? total_cost -= 1000 : nil
      fifteen_pounds_off?(voucher, total_cost, items) ? total_cost -= 1500 : nil
      total_cost
    end

    def exists?(voucher)
      voucher && voucher != ""
    end

    def five_pounds_off?(voucher)
      voucher == "LADYGODIVA"
    end

    def ten_pounds_off?(voucher, total_cost)
      voucher == "AYRTONSENNA" && total_cost > 5000
    end

    def fifteen_pounds_off?(voucher, total_cost, basket)
      voucher == "COMMODORE" && total_cost > 5000 && has_shoes?(basket)
    end

    def has_shoes?(basket)
      shoe_items = 0
      basket.each do |item|
        Product.get(item.to_i) && Product.get(item.to_i).category == "Footwear" ? shoe_items += 1 : nil
      end
      shoe_items > 0
    end

    def sum_basket(basket)
      total_cost = 0
      basket.each do |item|
        if Product.get(item)
          total_cost += Product.get(item).price.to_i
        end
      end
      total_cost
    end

    def format_pounds(total_cost)
      "%.2f" % (total_cost.to_f / 100)
    end

    def add_to_basket(item)
      change_stock(item, -1)
      basket = parse_basket
      basket << item
      cookies[:basket] = JSON.dump(basket)
    end

    def remove_from_basket(item)
      change_stock(item, 1)
      basket = parse_basket
      basket.delete_at(basket.index(item) || basket.length)
      cookies[:basket] = JSON.dump(basket)
    end

    def change_stock(item, amount)
      if Product.get(item)
        product = Product.get(item)
        product.update(stockroom_count: product.stockroom_count + amount)
      end
    end

    def parse_basket
      JSON.parse(URI.decode(cookies[:basket]))
    end
  end
end
