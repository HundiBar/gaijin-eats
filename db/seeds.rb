def place_lat_long(google_maps_url)
  regex = %r{!3d(-?\d+(?:\.\d+)?)!4d(-?\d+(?:\.\d+))}
  match = regex.match(google_maps_url)
  {lat: match[1], long: match[2]} if match && !match[1].blank? && !match[2].blank?
end

require "uri"
require "net/http"

url = URI("https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=Swan+%26+Lion&inputtype=textquery&fields=formatted_address%2Cname%2Crating%2Copening_hours%2Cgeometry%2Cphotos&key=#{ENV['tag']}")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Get.new(url)

response = https.request(request)
puts response.read_body


# photos_url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=Aap_uEAkX2nZsC9tOzNkMjF01DH1uiamRCW7AgYowfMBYtCYtvX0bEknLEwhPUAUBMAc1G6Wd1PV_wPMz60nevwR0cymVMPH_uTpZIMbwBEuMfytjq_ZFe-npSykUGKmk23dS85aeA4dYhFtj3nGTjQu28g-2nvn65mCPq5xk_3x8j8hgbc&key={key}"


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
