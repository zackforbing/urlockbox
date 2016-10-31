class User < ApplicationRecord
  has_many :links
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  has_secure_password
end
