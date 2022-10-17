class HomeController < ApplicationController

  def index
    @deadline_purchases = Purchase.where("unused_amount > 0 and waste_date < ?", Date.today + 3)
    
    @ingredients = Ingredient.all
    @alert_ingredient_name_list = []
    @ingredients.each do |ingredient|
      ingredient.decorate.alert_purchase(@alert_ingredient_name_list)
    end
  end
  
end
