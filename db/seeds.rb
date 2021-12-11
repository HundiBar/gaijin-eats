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
  long = place["geometry"].first["long"]
  lat = place["geometry"].first["lat"]
  rating = place["rating"]
  photo_ref = place["photos"].first["photo_reference"]
  photo_url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=#{photo_ref}&key=#{ENV['API_KEY']}"

  {
    address: formatted_address,
    rating: rating,
    photo_url: photo_url,
    long: long,
    lat: lat
  }
end

restaurant_urls = ['https://www.google.pl/maps/place/Toyoda+Cheesesteak/@35.6765512,139.6730251,17z/data=!3m1!4b1!4m5!3m4!1s0x6018f3f0b37b6971:0xd743de5aafbdf25f!8m2!3d35.6765521!4d139.6752074', 'https://www.google.pl/maps/place/440+Broadway+Taco+Shop/@35.6470831,139.714044,17z/data=!3m1!4b1!4m5!3m4!1s0x60188b952a357e9b:0xf7eeaebe3f5d3a7d!8m2!3d35.6470788!4d139.7162327', 'https://www.google.pl/maps/place/Shango/@35.6015794,139.7065851,17z/data=!3m2!4b1!5s0x60188abc5212fd73:0x476135a128d88401!4m5!3m4!1s0x60188abc53070001:0x15cd65744b931c13!8m2!3d35.6015751!4d139.7087738', 'https://www.google.pl/maps/place/Swan+%26+Lion/@35.6922773,139.7404285,17z/data=!3m1!4b1!4m5!3m4!1s0x60188c6884115fdf:0x83b6c3683e694f4b!8m2!3d35.692273!4d139.7426172', 'https://www.google.pl/maps/place/Mash+Bros/@35.698766,139.6953976,17z/data=!3m2!4b1!5s0x60188e34181f54e3:0x2ef6dc2af7c7758!4m5!3m4!1s0x60188deda6c30e6f:0x249b603c26a5f41e!8m2!3d35.6987617!4d139.6975863', 'https://www.google.pl/maps/place/Umami+Burger+Aoyama+Shop/@35.5772203,139.5845349,11z/data=!4m9!1m2!2m1!1sUmami+Burger!3m5!1s0x60188ca06783d2f3:0x74ee257b34cb0b04!8m2!3d35.6644638!4d139.709373!15sCgxVbWFtaSBCdXJnZXIiA4gBAVoOIgx1bWFtaSBidXJnZXKSARRoYW1idXJnZXJfcmVzdGF1cmFudA']

Place.destroy_all
puts "Creating seeds"

restaurant_urls.each do |restaurant_url|
  [:name] = name_from_url(restaurant_url)
  place_data = fetch_place(restaurant_url)
  Place.create!(place_data)
  puts "#{place_data[:name]} created"
end

puts "Seeds compiled"
puts "#{Place.all.count} places added"
