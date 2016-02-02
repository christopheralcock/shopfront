require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './app/models/product'

task :reset_products do
  Product.all.destroy
  Product.create(name: 'Almond Toe Court Shoes, Patent Black', category: 'Women\'s Footwear', price: 9900, stockroom_count: 5, basket_count: 0)
  Product.create(name: 'Suede Shoes, Blue', category: 'Women\'s Footwear', price: 4200, stockroom_count: 4, basket_count: 0)
  Product.create(name: 'Leather Driver Saddle Loafers, Tan', category: 'Men\'s Footwear', price: 3400, stockroom_count: 12, basket_count: 0)
  Product.create(name: 'Flip Flops, Red', category: 'Men\'s Footwear', price: 1900, stockroom_count: 6, basket_count: 0)
  Product.create(name: 'Flip Flops, Blue', category: 'Men\'s Footwear', price: 1900, stockroom_count: 0, basket_count: 0)
  Product.create(name: 'Gold Button Cardigan, Black', category: 'Women\'s Casualwear', price: 16700, stockroom_count: 6, basket_count: 0)
  Product.create(name: 'Cotton Shorts, Medium Red', category: 'Women\'s Casualwear', price: 3000, stockroom_count: 5, basket_count: 0)
  Product.create(name: 'Fine Stripe Short Sleeve Shirt, Grey', category: 'Men\'s Casualwear', price: 4999, stockroom_count: 9, basket_count: 0)
  Product.create(name: 'Fine Stripe Short Sleeve Shirt, Green', category: 'Men\'s Casualwear', previous_price: 4999, price: 3999 , stockroom_count: 3, basket_count: 0)
  Product.create(name: 'Sharkskin Waistcoat, Charcoal', category: 'Men\'s Casualwear', price: 7500, stockroom_count: 2, basket_count: 0)
  Product.create(name: 'Lightweight Patch Pocket Blazer, Deer', category: 'Men\'s Formalwear', price: 17550, stockroom_count: 1, basket_count: 0)
  Product.create(name: 'Bird Print Dress, Black', category: 'Women\'s Formalwear', price: 27000, stockroom_count: 10, basket_count: 0)
  Product.create(name: 'Mid Twist Cut-Out Dress, Pink', category: 'Women\'s Formalwear', price: 54000, stockroom_count: 5, basket_count: 0)
end
