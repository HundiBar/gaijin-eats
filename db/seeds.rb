require 'net/http'
require 'json'

url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=35.6765469,139.6752138&key=#{ENV['GMAPS_API_BROWSER_KEY']}"
uri = URI(url)
response = Net::HTTP.get(uri)
data = JSON.parse(response)
p data
# # https://www.google.com/maps/place/Toyoda+Cheesesteak/@35.6765469,139.6752138,15z/data=!4m5!3m4!1s0x0:0xd743de5aafbdf25f!8m2!3d35.6765521!4d139.6752074

# # https://maps.googleapis.com/maps/api/geocode/json?latlng=35.6765469,139.6752138&key=YOUR_API_KEY




# Place.destroy_all
# puts "Creating seeds"

# Place.create!(
#   address: '〒151-0072 東京都渋谷区幡ケ谷１丁目４−1 花ビル 1F',
#   name: 'Toyoda Cheesesteak'
# )

# Place.create!(
#   address: '〒150-0013 東京都渋谷区恵比寿１丁目２５−3 レジデンサプリマベェラァ201',
#   name: '440 Broadway Taco Shop'
# )

# Place.create!(
#   address: '〒142-0053 東京都品川区中延５丁目１３−16 パープルビル 2F',
#   name: 'Shango Cuban'
# )

# Place.create!(
#   address: '〒102-0074 東京都千代田区九段南３丁目５−4',
#   name: 'Swan & Lion'
# )

# Place.create!(
#   address: '〒169-0073 東京都新宿区百人町１丁目２４−8 2F A1 Shinjuku Town Plaza',
#   name: 'Mash Bros'
# )

# puts "Seeds compiled"
# puts "#{Place.all.count} places added"
