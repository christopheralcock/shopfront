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
    Product.create(name: 'Almond Toe Court Shoes', colour: 'Patent Black', gender: 'Women\'s', category: 'Footwear', previous_price: 10000, price: 9900, stockroom_count: 5)
    visit '/'
    click_on 'BUY'
    within 'section#basket-counter' do
      expect(page).to have_content('1 item(s)')
    end
  end

  scenario 'I can filter by gender' do
    Product.create(name: 'Almond Toe Court Shoes', colour: 'Patent Black', gender: 'Women\'s', category: 'Footwear', previous_price: 10000, price: 9900, stockroom_count: 5)
    Product.create(name: 'Almond Toe Court Shoes', colour: 'Patent Black', gender: 'Men\'s', category: 'Footwear', previous_price: 10000, price: 9900, stockroom_count: 1)
    visit '/'
    expect(page).to have_content('Women\'s Footwear')
    click_on 'M'
    expect(page).to_not have_content('Women\'s Footwear')
  end

end
