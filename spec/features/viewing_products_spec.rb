require 'spec_helper'

RSpec.feature 'Viewing products' do

  scenario 'I can see the catalogue of products on the home page' do
    Product.create(name: 'Almond Toe Court Shoes', colour: 'Patent Black', gender: 'Women\'s', category: 'Footwear', previous_price: 10000, price: 9900, stockroom_count: 5)
    visit '/'
    expect(page.status_code).to eq 200
    within 'ul#products' do
      expect(page).to have_content('£99.00')
      expect(page).to have_button('BUY')
    end
  end

  scenario 'I click the BUY button' do
    Product.create(name: 'Almond Toe Court Shoes', colour: 'Patent Black', gender: 'Women\'s', category: 'Footwear', previous_price: 10000, price: 9900, stockroom_count: 5, basket_count: 0)
    visit '/'
    click_on 'BUY'
    within 'section#basket_counter' do
      expect(page).to have_content('1 item(s)')
    end
  end

end
