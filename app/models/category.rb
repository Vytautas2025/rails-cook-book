class Category < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :recipes, throught: :bookmarks

  validates :name, uniqueness: true
end
