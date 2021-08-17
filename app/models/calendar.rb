class Calendar < ApplicationRecord

  belongs_to :user

  enum stamp_type: { "stamp1.png": 0, "stamp4.png": 1, "stamp3.png": 2, "stamp2.png": 3, "white.png": 4 },_suffix: true

end
