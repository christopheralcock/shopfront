require 'data_mapper'
require 'dm-postgres-adapter'

class Product

  include DataMapper::Resource

  property :id,         Serial
  property :name,       String
  property :category,   String
  property :price,      Integer
  property :stockroom,  Integer
  property :basket,     Integer

end

DataMapper.setup(:default, "postgres://localhost/shopfront_test")
DataMapper.finalize
DataMapper.auto_upgrade!
