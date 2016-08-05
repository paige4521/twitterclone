class User < ActiveRecord::Base
  has_many :tweets
  has_many :tweets, dependent: :destroy
  has_secure_password
  validates :password, length: {minimum: 6 }
end
