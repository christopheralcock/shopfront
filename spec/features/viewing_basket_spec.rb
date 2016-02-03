require 'spec_helper'

RSpec.feature 'Viewing basket' do

  scenario 'I can see the contents of the basket' do
    Product.create(name: 'Almond Toe Court Shoes', colour: 'Patent Black', gender: 'Women\'s', category: 'Footwear', previous_price: 10000, price: 9900, stockroom_count: 5)
    visit '/'
    click_on 'BUY'
    visit '/'
    click_link 'View your basket'
    expect(page.status_code).to eq 200
    within 'ul#basket_contents' do
      expect(page).to have_content('£99.00')
    end
  end


  scenario 'I click the discard button' do
    Product.create(name: 'Almond Toe Court Shoes', colour: 'Patent Black', gender: 'Women\'s', category: 'Footwear', previous_price: 10000, price: 9900, stockroom_count: 5)
    visit '/'
    click_on 'BUY'
    visit '/'
    click_link 'View your basket'
    expect(page.status_code).to eq 200
    expect(page).to have_content("1 Item(s) In Basket")
    expect(page).to have_content("Total: £99")
    click_on 'discard'
    expect(page).to have_content("0 Item(s) In Basket")
  end

end
