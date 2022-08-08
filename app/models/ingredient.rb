class Ingredient < ApplicationRecord
  has_one :stock, dependent: :destroy
  has_many :purchase
  has_many :menu_ingredients
  has_many :menus, through: :menu_ingredients
end
