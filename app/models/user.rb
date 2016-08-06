class User < ActiveRecord::Base

  #when a user is deleted ~ we delete the associated dependencies i.e. tweets
  has_many :tweets, dependent: :destroy

  validates :password, presence: true, length: {minimum: 6 }
  validates :email, presence: true
  has_secure_password
end
