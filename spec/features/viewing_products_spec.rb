require 'spec_helper'

RSpec.feature 'Viewing products' do

  scenario 'I can see the catalogue of products on the home page' do
    Link.create(name: 'Almond Toe Court Shoes, Patent Black', category: 'Women\'s Footwear', price: 99, quantity: 5)
    visit '/'
    expect(page.status_code).to eq 200
    within 'ul#products' do
      expect(page).to have_content('£99.00')
    end
  end
end
