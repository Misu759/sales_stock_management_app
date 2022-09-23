class Menu < ApplicationRecord
  enum category: %i[food sweets drink]
  validates :name, presence: true, length: { minimum: 2 }, uniqueness: { case_sensitive: false }
  has_many :sales
  has_many :menu_ingredients
  has_many :ingredients, through: :menu_ingredients

  def cost_price
    cost = 0
    menu_ingredients.each {|menu_ingredient| cost += menu_ingredient.ingredient.purchase_cost * menu_ingredient.amount}
    cost
  end

end
