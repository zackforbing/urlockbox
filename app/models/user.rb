class User < ApplicationRecord
  validates :email, presence: true
  validates_uniqueness_of :email, presence: true
  validates :password, presence: true
  has_secure_password
end
