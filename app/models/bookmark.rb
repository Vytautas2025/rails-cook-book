class Bookmark < ApplicationRecord
  belongs_to :recipe
  belongs_to :comment
end
