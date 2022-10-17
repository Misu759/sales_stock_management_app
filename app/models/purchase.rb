class Purchase < ApplicationRecord
  before_create{ self.unused_amount = self.amount }

  belongs_to :ingredient
  validates :amount, presence: true
end
