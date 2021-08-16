class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_many :calendars
  has_many :comments, dependent: :destroy
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  # 被フォロー関係を通じて参照→followed_idをフォローしている人

  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 【class_name: "Relationship"】は省略可能
  has_many :followings, through: :relationships, source: :followed
  # 与フォロー関係を通じて参照→follower_idをフォローしている人

  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  def following?(user)
    followings.include?(user)
  end


  enum age_status: { "---": 0, "高校生": 1, "大学生": 2, "浪人生": 3, "大学院生": 4, "専門学生": 5, "社会人": 6 },_suffix: true

  enum job_status: { "---": 0, "営業": 1, "事務・オフィスワーク": 2, "販売": 3, "飲食・フード": 4, "サービス・警備・清掃": 5,
                     "イベント・レジャー・娯楽": 6, "教育・カルチャー・スポーツ": 7, "理・美容": 8, "医療・介護・福祉": 9,
                     "ドライバー・配達": 10, "製造・工場・倉庫": 11, "IT・エンジニア": 12, "クリエイティブ・編集・出版": 13,
                     "専門職": 14, "土木・建設・農水産": 15, "主婦・主夫": 16, "フリーター": 17},_suffix: true
end
