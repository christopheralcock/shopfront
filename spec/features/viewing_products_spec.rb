require 'spec_helper'

RSpec.feature 'Viewing products' do

  scenario 'I can see the catalogue of products on the home page' do
    Product.create(name: 'Almond Toe Court Shoes, Patent Black', category: 'Women\'s Footwear', price: 9900, stockroom_count: 5, basket_count: 0)
    visit '/'
    expect(page.status_code).to eq 200
    within 'ul#products' do
      expect(page).to have_content('£99.00')
    end
  end
end
