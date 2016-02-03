require 'data_mapper'
require 'dm-postgres-adapter'

class Product

  include DataMapper::Resource

  property :id,               Serial
  property :name,             String
  property :colour,           String
  property :gender,           String
  property :category,         String
  property :previous_price,   Integer
  property :price,            Integer
  property :stockroom_count,  Integer
  property :basket_count,     Integer

  def formatted_price
    pounds = "%.2f" % (price.to_f / 100)
    "£#{pounds}"
  end

  def formatted_previous_price
      pounds = "%.2f" % (previous_price.to_f / 100)
      if pounds != "0.00"
        "£#{pounds}"
      end
  end


end

DataMapper.setup(:default, "postgres://localhost/shopfront")
DataMapper.finalize
DataMapper.auto_upgrade!
