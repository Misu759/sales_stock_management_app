class IngredientDecorator < ApplicationDecorator
  delegate_all

  def unit_cost
    (purchase_cost / unit_amount).round(2)
  end

  def alert_purchase(list)
    list << name if stock <= threshold.to_i
  end
end
