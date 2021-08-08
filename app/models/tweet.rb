class Tweet < ApplicationRecord

  has_many :tweet_images, dependent: :destroy
  has_many :comments
  belongs_to :user

  enum stamp_type: { "stamp1.png": 0, "stamp2.png": 1, "stamp3.png": 2, "stamp4.png": 3 }

end
