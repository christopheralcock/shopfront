require 'sinatra/base'
require_relative 'models/product'

class Shopfront < Sinatra::Base

  get '/' do
    @products = Product.all
    erb :'index'
  end

  post '/buy' do
    
    redirect '/'
  end

end
