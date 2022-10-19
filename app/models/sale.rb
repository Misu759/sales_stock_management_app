class Sale < ApplicationRecord
  validates :quantity, presence: true
  validates :date, presence: true
  belongs_to :menu
end
