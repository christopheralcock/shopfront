require 'sinatra/base'
require_relative 'models/product'

class Shopfront < Sinatra::Base

  get '/' do
    @products = Product.all
    erb :'index'
  end

  post '/buy' do
    product = Product.get(params[:product_id])
    product.update(basket_count: product.basket_count + 1)
    product.update(stockroom_count: product.stockroom_count - 1)
    redirect '/'
  end


end
