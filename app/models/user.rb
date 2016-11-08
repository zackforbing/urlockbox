class User < ApplicationRecord
  has_many :links
  validates :email, presence: true, uniqueness: true
  has_secure_password
end
