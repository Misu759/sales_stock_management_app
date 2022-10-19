class Waste < ApplicationRecord
  validates :amount, :date, presence: true

  belongs_to :ingredient
end
