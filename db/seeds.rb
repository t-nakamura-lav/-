# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  email: 'test1@test.com',
  name: 'ハナ',
  password: '123456',
  profile_image: File.open('./app/assets/images/users/1.jpg'),
  introduction: 'いわゆるバリキャリってやつです。よろしくお願いします！',
  age_status: '社会人',
  job_status: '営業',
  challenge_contents: '営業'
)

User.create!(
  email: 'test2@test.com',
  name: 'タロー',
  password: '123456',
  profile_image: File.open('./app/assets/images/users/2.jpg'),
  introduction: '就職活動がんばります！',
  age_status: '大学院生',
  challenge_contents: '就活'
)

User.create!(
  email: 'test3@test.com',
  name: 'まろん',
  password: '123456',
  profile_image: File.open('./app/assets/images/users/7.jpg'),
  introduction: '高３です！大学受験がんばります！',
  age_status: '高校生',
  challenge_contents: '受験勉強'
)

User.create!(
  email: 'test4@test.com',
  name: 'みほ',
  password: '123456',
  profile_image: File.open('./app/assets/images/users/3.jpg'),
  introduction: 'よろしくお願いします！',
  age_status: '社会人',
  job_status: '事務・オフィスワーク',
  challenge_contents: '簿記２急'
)

User.create!(
  email: 'test5@test.com',
  name: 'サトル',
  password: '123456',
  profile_image: File.open('./app/assets/images/users/4.jpg'),
  introduction: '大学受験、今年で決める！',
  age_status: '浪人生',
  challenge_contents: '受験勉強'
)

User.create!(
  email: 'test6@test.com',
  name: 'スズキ',
  password: '123456',
  profile_image: File.open('./app/assets/images/users/5.jpg'),
  introduction: 'よろしくお願いします。',
  age_status: '社会人',
  job_status: '教育・カルチャー・スポーツ',
  challenge_contents: '歴史'
)

User.create!(
  email: 'test7@test.com',
  name: 'くりはらさん',
  password: '123456',
  profile_image: File.open('./app/assets/images/users/6.jpg'),
  introduction: '継続できるようがんばります。',
  age_status: '社会人',
  job_status: '主婦・主夫',
  challenge_contents: 'パソコン（word、excel）'
)


User.all.each do |user|
  user.tweets.create!(
    challenge: Faker::ProgrammingLanguage.name,
    tweet: Faker::Coffee.blend_name,
    hour_attribute: '10',
    minute_attribute: '00'
  )
end