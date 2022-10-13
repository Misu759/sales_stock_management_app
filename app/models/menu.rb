class Menu < ApplicationRecord
  enum category: %i[food sweets drink]
  validates :name, presence: true, length: { minimum: 2 }, uniqueness: { case_sensitive: false }
  has_many :sales
  has_many :menu_ingredients
  has_many :ingredients, through: :menu_ingredients

end
