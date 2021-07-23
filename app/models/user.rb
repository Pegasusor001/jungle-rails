class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  has_secure_password
  validates :password_digest, presence: true
end
