module Voucher

  def sum_basket(basket)
    total_count = 0
    basket.each do |item|
      if Product.get(item)
        total_cost += Product.get(item).price.to_i
      end
    end
  end
end
