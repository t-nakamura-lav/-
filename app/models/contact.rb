class Contact < ApplicationRecord

  # emailの場合
  # validates :email, presence: true, length: {maximum:255},
  #                   format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates :message, presence: true
  validates :name, presence: true, length: {maximum:20}

end