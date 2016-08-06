class Tweet < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true, length: {maximum: 170}
 
end
