class Purchase < ApplicationRecord
  belongs_to :ingredient
  validates :amount, presence: true
end
