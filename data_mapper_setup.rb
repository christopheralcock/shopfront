require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/shopfront_#{env}")

require './app/models/product' # require each model individually - the path may vary depending on your file structure.

DataMapper.finalize

DataMapper.auto_upgrade!
