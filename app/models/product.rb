require 'data_mapper'
require 'dm-postgres-adapter'
require 'active_support/number_helper'

class Product

  include DataMapper::Resource

  property :id,         Serial
  property :name,       String
  property :category,   String
  property :price,      Integer
  property :stockroom,  Integer
  property :basket,     Integer

  def in_pounds(pennies)
    number_to_currency(pennies/100, precision: 2)
  end

end

DataMapper.setup(:default, "postgres://localhost/shopfront_test")
DataMapper.finalize
DataMapper.auto_upgrade!
