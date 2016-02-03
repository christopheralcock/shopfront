require 'sinatra/base'
require_relative 'models/product'

class Shopfront < Sinatra::Base

  get '/' do
    @products = Product.all
    erb :'index'
  end

  post '/buy' do
    p params[:product_id]
    @basket = Product.get(params[:product_id]).basket_count
    p @basket
    Product.get(params[:product_id]).update(basket_count: @basket + 1)
    p Product.get(params[:product_id]).basket_count
    redirect '/'
  end


end
