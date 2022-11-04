class Purchase < ApplicationRecord
  before_create{ self.unused_amount = self.amount * self.ingredient.unit_amount }

  validates :amount, presence: true
  validates :purchase_date, presence: true

  belongs_to :ingredient
end
