class Menu < ApplicationRecord
  enum category: %i[food sweets drink]
  validates :name, presence: true, length: { minimum: 2 }, uniqueness: { case_sensitive: false }
  validates :category, presence: true
  
  has_many :sales
  has_many :menu_ingredients, dependent: :destroy
  has_many :ingredients, through: :menu_ingredients

end
