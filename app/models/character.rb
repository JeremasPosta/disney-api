class Character < ApplicationRecord
  validates :image, presence: true, length: {minimum: 2}
  validates :name, presence: true, length: {minimum: 1}
  validates :age, presence: true, length: {minimum: 1}
  validates :weight, presence: true, length: {minimum: 1}
  validates :history, presence: true, length: {minimum: 2}
  has_many :cast_in_movies
  has_many :movies, through: :cast_in_movies, foreign_key: :movie_id
end