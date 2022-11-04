class Menu < ApplicationRecord
  enum category: %i[food sweets drink]
  validates :name, presence: true, length: { minimum: 2 }, uniqueness: { case_sensitive: false }
  validates :category, presence: true
  
  # メニューを削除した場合も過去の売上のデータは残るように
  # (一旦エラーが出ないように dependent: :destroy つける)
  has_many :sales, dependent: :destroy
  has_many :menu_ingredients, dependent: :destroy
  has_many :ingredients, through: :menu_ingredients

end
