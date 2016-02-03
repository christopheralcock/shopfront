require_relative "../app/models/product.rb"

product = Product.new(price: 9900)

describe Product do

  it "can present pennies as pounds" do
    expect(product.formatted_price).to eq("£99.00")
  end

end
