class ApplicationController < ActionController::Base

  def cost_price(menu)
    cost = 0
    menu.menu_ingredients.each {|menu_ingredient| cost += menu_ingredient.ingredient.purchase_cost * menu_ingredient.amount}
    cost
  end

end
