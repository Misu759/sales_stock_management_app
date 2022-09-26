class Ingredient < ApplicationRecord
  has_many :purchases
  has_many :menu_ingredients
  has_many :menus, through: :menu_ingredients
  has_many :wastes 
end
