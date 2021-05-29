class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true
  validates :name, presence: true
  has_secure_password
end
