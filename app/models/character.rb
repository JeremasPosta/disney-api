class Character < ApplicationRecord
  validates :image, presence: true, length: {minimum: 2}
  validates :name, presence: true, length: {minimum: 1}
  validates :age, presence: true, length: {minimum: 1}
  validates :weight, presence: true, length: {minimum: 1}
  validates :history, presence: true, length: {minimum: 2}
  validates :filmography, presence: true, length: {minimum: 2}
end