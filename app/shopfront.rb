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

    p JSON.parse(URI.decode(cookies[:basket]))

    product = Product.get(params[:product_id])
    product.update(stockroom_count: product.stockroom_count - 1)
    redirect '/'
  end

  get '/basket' do

  end


end
