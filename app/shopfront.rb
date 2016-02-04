require 'sinatra/base'
require 'sinatra/cookies'
require 'JSON'
require 'URI'
require_relative 'models/product'

class Shopfront < Sinatra::Base
  helpers Sinatra::Cookies
  # helpers ControllerHelpers

  get '/' do
    @products = Product.all
    @basket_count = cookies[:basket] ? JSON.parse(URI.decode(cookies[:basket])).count : 0
    erb :'index'
  end

  post '/buy' do
    cookies[:basket] ||= JSON.dump([])
    cookies[:basket] = add_to_basket(cookies[:basket], params[:product_id])
    redirect '/'
  end

  post '/discard' do
    cookies[:basket] = remove_from_basket(cookies[:basket], params[:product_id])
    redirect '/basket'
  end

  post '/voucher' do
    cookies[:voucher] = params[:voucher]
    p cookies
    redirect '/basket'
  end

  get '/basket' do
    @basket_contents = JSON.parse(URI.decode(cookies[:basket]))
    @products = Product.all
    @total_cost = sum_basket(@basket_contents)
    cookies[:voucher] == "LADYGODIVA" ? @total_cost -= 500 : nil
    cookies[:voucher] == "AYRTONSENNA" && @total_cost > 5000 ? @total_cost -= 1000 : nil
    @total_cost = format_pounds(@total_cost)
    erb :'basket'
  end

  helpers do

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


    def add_to_basket(cookie_basket, item)
      change_stock(item, -1)
      basket = JSON.parse(URI.decode(cookie_basket))
      basket << item
      cookie_basket = JSON.dump(basket)
    end

    def remove_from_basket(cookie_basket, item)
      change_stock(item, 1)
      basket = JSON.parse(URI.decode(cookie_basket))
      basket.delete_at(basket.index(item) || basket.length)
      JSON.dump(basket)
    end

    def change_stock(item, amount)
      product = Product.get(item)
      product.update(stockroom_count: product.stockroom_count + amount)
    end

  end

end
