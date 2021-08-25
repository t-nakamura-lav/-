# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  email: 'test1@test.com',
  name: 'タロー',
  password: '123456',
  profile_image: File.open('./app/assets/images/users/1.jpg'),
  age_status: '高校生'
)

Tweet.create!(
  challenge: 'プログラミング',
  tweet: 'がんばってます！'
)