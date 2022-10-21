class PurchaseDecorator < ApplicationDecorator
  delegate_all

  def update_amount_to_purchase(value)
    if purchase.unused_amount - value >= 0
      purchase.unused_amount -= value
      purchase.save!      
    else
      diff = value - purchase.unused_amount
      purchase.unused_amount = 0
      purchase.save!
      # 再帰
      next_purchase = ingredient.purchases.where("unused_amount > 0").first
      next_purchase.decorate.update_amount_to_purchase(diff)
    end
  end
end