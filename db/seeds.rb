require "uri"

def name_from_url(google_maps_url)
  regex = %r{place/(.*?)\/}
  match = regex.match(google_maps_url)
  match[1] if match && !match[1].blank?
end

def fetch_place(google_maps_url)
  place_name = name_from_url(google_maps_url)
  url = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=#{place_name}&inputtype=textquery&fields=formatted_address%2Cname%2Crating%2Copening_hours%2Cgeometry%2Cphotos&key=#{ENV['API_KEY']}"

  result_serialized = URI.open(url).read
  result = JSON.parse(result_serialized)
  place = result["candidates"].first
  formatted_address = place["formatted_address"]
  name = place["name"]
  rating = place["rating"]
  photo_ref = place["photos"].first["photo_reference"]
  photo_url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=#{photo_ref}&key=#{ENV['API_KEY']}"

  {
    formatted_address: formatted_address,
    name: name,
    rating: rating,
    photo_url: photo_url
  }
end

p fetch_place('https://www.google.pl/maps/place/Setagaya+Memorial+Hospital/@35.5994867,139.6211712,15z/data=!4m5!3m4!1s0x6018f44e594e52e9:0x70b81b675c6b6d8d!8m2!3d35.6037431!4d139.638029')

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
