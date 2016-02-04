require 'spec_helper'

RSpec.feature 'Viewing basket' do

  scenario 'I can see the contents of the basket' do
    Product.create(name: 'Almond Toe Court Shoes', colour: 'Patent Black', gender: 'Women\'s', category: 'Footwear', previous_price: 10000, price: 9900, stockroom_count: 5)
    visit '/'
    click_on 'BUY'
    click_link 'View your basket'
    expect(page.status_code).to eq 200
    within 'ul#basket_contents' do
      expect(page).to have_content('£99.00')
    end
  end


  scenario 'I click the discard button' do
    Product.create(name: 'Almond Toe Court Shoes', colour: 'Patent Black', gender: 'Women\'s', category: 'Footwear', previous_price: 10000, price: 9900, stockroom_count: 1)
    visit '/'
    click_on 'BUY'
    click_link 'View your basket'
    expect(page.status_code).to eq 200
    expect(page).to have_content("1 Item(s) In Basket")
    expect(page).to have_content("Total: £99")
    click_on 'Return to shop'
    expect(page).to have_content("Item out of stock")
    click_link 'View your basket'
    click_on 'discard'
    expect(page).to have_content("0 Item(s) In Basket")
    click_on 'Return to shop'
    expect(page).to have_content("BUY")
  end

  scenario 'I can apply the £5 off voucher' do
    Product.create(name: 'Almond Toe Court Shoes', colour: 'Patent Black', gender: 'Women\'s', category: 'Footwear', previous_price: 10000, price: 9900, stockroom_count: 1)
    visit '/'
    click_on 'BUY'
    click_link 'View your basket'
    expect(page).to have_content("Total: £99")
    expect(page).to have_content("If you have a voucher code, enter it here")
    fill_in "voucher", with: 'LADYGODIVA'
    click_on 'apply voucher'
    expect(page).to have_content("Total: £94")
    fill_in "voucher", with: 'LADYGODIVA'
    click_on 'apply voucher'
    expect(page).to have_content("Total: £94")
  end

  scenario 'I can apply the £10 off voucher' do
    Product.create(name: 'Almond Toe Court Shoes', colour: 'Patent Black', gender: 'Women\'s', category: 'Footwear', previous_price: 10000, price: 9900, stockroom_count: 1)
    visit '/'
    click_on 'BUY'
    click_link 'View your basket'
    expect(page).to have_content("Total: £99")
    expect(page).to have_content("If you have a voucher code, enter it here")
    fill_in "voucher", with: 'AYRTONSENNA'
    click_on 'apply voucher'
    expect(page).to have_content("Total: £89")
  end


  scenario 'I can apply the £15 off voucher' do
    Product.create(name: 'Almond Toe Court Shoes', colour: 'Patent Black', gender: 'Women\'s', category: 'Footwear', previous_price: 10000, price: 9900, stockroom_count: 1)
    visit '/'
    click_on 'BUY'
    click_link 'View your basket'
    expect(page).to have_content("Total: £99")
    expect(page).to have_content("If you have a voucher code, enter it here")
    fill_in "voucher", with: 'COMMODORE'
    click_on 'apply voucher'
    expect(page).to have_content("Total: £84")
  end


  scenario 'I apply an invalid voucher' do
    Product.create(name: 'Almond Toe Court Shoes', colour: 'Patent Black', gender: 'Women\'s', category: 'Footwear', previous_price: 10000, price: 9900, stockroom_count: 1)
    visit '/'
    click_on 'BUY'
    click_link 'View your basket'
    expect(page).to have_content("Total: £99")
    expect(page).to have_content("If you have a voucher code, enter it here")
    fill_in "voucher", with: 'SOMEOLDNONSENSE'
    click_on 'apply voucher'
    expect(page).to have_content("Voucher not valid")
  end

end
