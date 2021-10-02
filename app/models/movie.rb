class Movie < ApplicationRecord
  validates :image, presence: true, length: {minimum: 2}
  validates :title, presence: true, length: {minimum: 1}
  validates :realese, presence: true, length: {minimum: 1}
  validates :qualification, presence: true, length: {minimum: 1}, inclusion: 1..5
  belongs_to :genre
  has_many :cast_in_movies
  has_many :characters, through: :cast_in_movies, foreign_key: :character_id
end

