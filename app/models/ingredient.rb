class Ingredient < ApplicationRecord
  has_one :stock, dependent: :destroy
  has_many :purchase
end
