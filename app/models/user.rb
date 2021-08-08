class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_many :comments
  has_many :tweets

  enum age_status: { "---": 0, "高校生": 1, "大学生": 2, "浪人生": 3, "大学院生": 4, "専門学生": 5, "社会人": 6 },_suffix: true

  enum job_status: { "---": 0, "営業": 1, "事務・オフィスワーク": 2, "販売": 3, "飲食・フード": 4, "サービス・警備・清掃": 5,
                     "イベント・レジャー・娯楽": 6, "教育・カルチャー・スポーツ": 7, "理・美容": 8, "医療・介護・福祉": 9,
                     "ドライバー・配達": 10, "製造・工場・倉庫": 11, "IT・エンジニア": 12, "クリエイティブ・編集・出版": 13,
                     "専門職": 14, "土木・建設・農水産": 15},_suffix: true
end
