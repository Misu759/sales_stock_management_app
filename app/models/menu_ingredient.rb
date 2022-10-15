class MenuIngredient < ApplicationRecord
  belongs_to :menu
  belongs_to :ingredient

  validates :amount, presence: true
  validates :menu_id, uniqueness: { scope: :ingredient_id }
end
