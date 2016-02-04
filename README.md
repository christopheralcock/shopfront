Hello!

Welcome to the store.

To get this up and running, ensure you have Ruby and Postgres.

in PSQL

`\c database shopfront;`

`\c database shopfrontdevelopment;`

back in bash

`bundle install` to install gems

`rspec` to verify my test suite

`rackup` to let datamapper make the table on development

ctrl+c to exit rackup

`rake reset_products` to fill the database with the necessary items

`rackup` to get the server running

then navigate to <a href="http://localhost:9292/">here</a>

The structure of the site is standard MVC - the product model is here: https://github.com/christopheralcock/shopfront/blob/master/app/models/product.rb
The shopping basket is held in cookies.

The views are here:
https://github.com/christopheralcock/shopfront/tree/master/app/views

And the controller and its helper methods are here:
https://github.com/christopheralcock/shopfront/blob/master/app/shopfront.rb
