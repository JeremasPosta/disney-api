class Genre < ApplicationRecord
  validates :image, presence: true, length: {minimum: 2}
  validates :name, presence: true, length: {minimum: 1}
  validates :related_shows, presence: true, length: {minimum: 1}
end
