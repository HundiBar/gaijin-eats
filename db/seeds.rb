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
