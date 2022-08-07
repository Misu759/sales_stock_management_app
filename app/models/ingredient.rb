class Ingredient < ApplicationRecord
  has_one :stock, dependent: :destroy
end
