require_relative "../app/models/product.rb"

product = Product.new(price: 9900, previous_price: 10000)
product_2 = Product.new(price: 9900, previous_price: nil)

describe Product do

  it "can present the current price in pennies as pounds" do
    expect(product.formatted_price).to eq("£99.00")
  end

  it "can present the previous price in pennies as pounds" do
    expect(product.formatted_previous_price).to eq("£100.00")
  end

  it "doesn't show a previous price when there isn't one" do
    expect(product_2.formatted_previous_price).to eq(nil)
  end

end
