class Supplier < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :phone_number, length: { maximum: 20 }

  has_many :ingredients
end
