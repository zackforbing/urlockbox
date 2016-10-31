class User < ApplicationRecord
  validates :email, presence: true
  validates_uniqueness_of :email, presence: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  has_secure_password
end
