class MenuDecorator < ApplicationDecorator
  delegate_all

  def cost_price
    cost = 0
    menu_ingredients.each {|menu_ingredient| cost += menu_ingredient.ingredient.decorate.unit_cost * menu_ingredient.amount}
    cost.round(2)
  end

  def cost_rate
    ((decorate.cost_price / regular_cost) * 100).round(2)
  end
end
