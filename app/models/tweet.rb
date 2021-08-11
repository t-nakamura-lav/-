class Tweet < ApplicationRecord

  has_many_attached :images
  has_many :comments
  belongs_to :user

  # enum stamp_type: { stamp1: 0, stamp2: 1, stamp3: 2, stamp4: 3 }

end
