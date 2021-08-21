class Calendar < ApplicationRecord

  belongs_to :user

  enum stamp_type: { "stamp1.jpg": 0, "stamp4.jpg": 1, "stamp3.jpg": 2, "stamp2.jpg": 3, "white.jpg": 4 },_suffix: true

end
