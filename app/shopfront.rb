require 'sinatra/base'
require 'sinatra/cookies'
require 'JSON'
require 'URI'
require_relative 'models/product'

class Shopfront < Sinatra::Base
  helpers Sinatra::Cookies

  get '/' do
    @products = Product.all
    cookies[:basket] ? @basket_count = JSON.parse(URI.decode(cookies[:basket])).count : @basket_count = 0
    erb :'index'
  end

  post '/buy' do
    cookies[:basket] ||= JSON.dump([])
    cookies[:basket] = add_to_basket(cookies[:basket], params[:product_id])
    redirect '/'
  end

  post '/discard' do
    change_stock(params[:product_id], 1)
    basket = JSON.parse(URI.decode(cookies[:basket]))
    basket.delete_at(basket.index(params[:product_id]) || basket.length)
    cookies[:basket] = JSON.dump(basket)
    redirect '/basket'
  end

  get '/basket' do
    @basket_contents = JSON.parse(URI.decode(cookies[:basket]))
    @products = Product.all
    @total_cost = sum_basket(@basket_contents)
    erb :'basket'
  end

  def sum_basket(basket)
    total_cost = 0
    basket.each do |item|
      if Product.get(item)
        total_cost += Product.get(item).price.to_i
      end
    end
    "%.2f" % (total_cost.to_f / 100)
  end

  def add_to_basket(cookie_basket, item)
    change_stock(item, -1)
    basket = JSON.parse(URI.decode(cookie_basket))
    basket << item
    cookie_basket = JSON.dump(basket)
  end

  def change_stock(item, amount)
    product = Product.get(item)
    product.update(stockroom_count: product.stockroom_count + amount)
  end

end
