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
    # cookies[:basket] = JSON.dump([])
    basket = JSON.parse(URI.decode(cookies[:basket]))
    basket << params[:product_id]
    cookies[:basket] = JSON.dump(basket)
    product = Product.get(params[:product_id])
    product.update(stockroom_count: product.stockroom_count - 1)
    redirect '/'
  end

  post '/discard' do
    basket = JSON.parse(URI.decode(cookies[:basket]))
    basket.delete_at(basket.index(params[:product_id]) || basket.length)
    cookies[:basket] = JSON.dump(basket)
    redirect '/basket'
  end

  get '/basket' do
    # cookies[:basket] ? @basket_contents = JSON.parse(URI.decode(cookies[:basket])) : @basket_contents = []
    @basket_contents = JSON.parse(URI.decode(cookies[:basket]))
    @products = Product.all
    @total_cost = 0
    @basket_contents.each do |item|
      if Product.get(item)
        @total_cost += Product.get(item).price.to_i
      end
    end
    @total_cost = "%.2f" % (@total_cost.to_f / 100)
    erb :'basket'
  end


end
