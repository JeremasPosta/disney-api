class Genre < ApplicationRecord
  validates :image, presence: true, length: {minimum: 2}
  validates :name, presence: true, length: {minimum: 1}
  has_many :movies
end
