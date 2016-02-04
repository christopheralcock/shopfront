require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './app/models/product'


DataMapper.setup(:default, "postgres://localhost/shopfrontdevelopment")


task :reset_products do
  Product.all.destroy
  Product.create(name: 'Almond Toe Court Shoes',          colour:'Patent Black',  gender: 'Women\'s', category: 'Footwear',                         price: 9900,  stockroom_count: 5,   image_location: 'Almond-Toe-Court-Shoes-Patent-Black')
  Product.create(name: 'Suede Shoes',                     colour: 'Blue',         gender: 'Women\'s', category: 'Footwear',                         price: 4200,  stockroom_count: 4,   image_location: 'Suede-Shoes-Blue')
  Product.create(name: 'Leather Driver Saddle Loafers',   colour: 'Tan',          gender: 'Men\'s',   category: 'Footwear',                         price: 3400,  stockroom_count: 12,  image_location: 'Leather-Driver-Saddle-Loafers-Tan')
  Product.create(name: 'Flip Flops',                      colour: 'Red',          gender: 'Men\'s',   category: 'Footwear',                         price: 1900,  stockroom_count: 6,   image_location: 'Flip-Flops-Red')
  Product.create(name: 'Flip Flops',                      colour: 'Blue',         gender: 'Men\'s',   category: 'Footwear',                         price: 1900,  stockroom_count: 0,   image_location: 'Flip-Flops-Blue')
  Product.create(name: 'Gold Button Cardigan',            colour: 'Black',        gender: 'Women\'s', category: 'Casualwear',                       price: 16700, stockroom_count: 6,   image_location: 'Gold-Button-Cardigan-Black')
  Product.create(name: 'Cotton Shorts',                   colour: 'Medium Red',   gender: 'Women\'s', category: 'Casualwear',                       price: 3000,  stockroom_count: 5,   image_location: 'Cotton-Shorts-Medium-Red')
  Product.create(name: 'Fine Stripe Short Sleeve Shirt',  colour: 'Grey',         gender: 'Men\'s',   category: 'Casualwear',                       price: 4999,  stockroom_count: 9,   image_location: 'Fine-Stripe-Short-Sleeve-Shirt-Grey')
  Product.create(name: 'Fine Stripe Short Sleeve Shirt',  colour: 'Green',        gender: 'Men\'s',   category: 'Casualwear', previous_price: 4999, price: 3999 , stockroom_count: 3,   image_location: 'Fine-Stripe-Short-Sleeve-Shirt-Green')
  Product.create(name: 'Sharkskin Waistcoat',             colour: 'Charcoal',     gender: 'Men\'s',   category: 'Casualwear',                       price: 7500,  stockroom_count: 2,   image_location: 'Sharkskin-Waistcoat-Charcoal')
  Product.create(name: 'Lightweight Patch Pocket Blazer', colour: 'Deer',         gender: 'Men\'s',   category: 'Formalwear',                       price: 17550, stockroom_count: 1,   image_location: 'Lightweight-Patch-Pocket-Blazer-Deer')
  Product.create(name: 'Bird Print Dress',                colour: 'Black',        gender: 'Women\'s', category: 'Formalwear',                       price: 27000, stockroom_count: 10,  image_location: 'Bird-Print-Dress-Black')
  Product.create(name: 'Mid Twist Cut-Out Dress',         colour: 'Pink',         gender: 'Women\'s', category: 'Formalwear',                       price: 54000, stockroom_count: 5,   image_location: 'Mid-Twist-Cut-Out-Dress-Pink')
end
