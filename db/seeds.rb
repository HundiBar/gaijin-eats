# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Place.destroy_all
puts "Creating seeds"

Place.create!(
  address: '〒151-0072 東京都渋谷区幡ケ谷１丁目４−1 花ビル 1F',
  name: 'Toyoda Cheesesteak'
)

Place.create!(
  address: '〒150-0013 東京都渋谷区恵比寿１丁目２５−3 レジデンサプリマベェラァ201',
  name: '440 Broadway Taco Shop'
)

Place.create!(
  address: '〒142-0053 東京都品川区中延５丁目１３−16 パープルビル 2F',
  name: 'Shango Cuban'
)

Place.create!(
  address: '〒102-0074 東京都千代田区九段南３丁目５−4',
  name: 'Swan & Lion'
)
