require 'data_mapper'
require 'dm-postgres-adapter'

class Product

  include DataMapper::Resource

  property :id,               Serial
  property :name,             String
  property :category,         String
  property :previous_price,   Integer
  property :price,            Integer
  property :stockroom_count,  Integer
  property :basket_count,     Integer

  def as_pounds(pennies)
    pennies/100
  end

end

DataMapper.setup(:default, "postgres://localhost/shopfront")
DataMapper.finalize
DataMapper.auto_upgrade!
