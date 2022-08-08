class Waste < ApplicationRecord
  belongs_to :ingredient
  validates :amount, :date, presence: true
end
