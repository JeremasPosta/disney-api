class ScreenShow < ApplicationRecord
  validates :image, presence: true, length: {minimum: 2}
  validates :title, presence: true, length: {minimum: 1}
  validates :realese, presence: true, length: {minimum: 1}
  validates :qualification, presence: true, length: {minimum: 1}, inclusion: 1..5
  validates :cast_characters, presence: true, length: {minimum: 2}
end

