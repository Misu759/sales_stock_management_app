class Menu < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }, uniqueness: { case_sensitive: false }
  has_many :sales
end
