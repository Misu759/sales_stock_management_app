class Ingredient < ApplicationRecord
  has_many :purchases
  has_many :menu_ingredients, dependent: :destroy
  has_many :menus, through: :menu_ingredients
  has_many :wastes
  belongs_to :supplier
end
