class Recipe < ApplicationRecord
  has_many :bookmarks
  validates :description, presence: true
  validates :name, uniqueness: true
  validates :rating, length: { in: 0..5 }
end
