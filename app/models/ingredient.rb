class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :purchase_cost, presence: true
  validates :stock, presence: true
  validates :unit_amount, presence: true

  has_many :purchases, dependent: :destroy
  has_many :menu_ingredients, dependent: :destroy
  has_many :menus, through: :menu_ingredients
  has_many :wastes, dependent: :destroy
  belongs_to :supplier
end
