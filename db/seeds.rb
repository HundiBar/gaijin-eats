# require "uri"

# def name_from_url(google_maps_url)
#   regex = %r{place/(.*?)\/}
#   match = regex.match(google_maps_url)
#   match[1] if match && !match[1].blank?
# end

# def lat_long_form_url(google_maps_url)
#   regex = %r{!3d(-?\d+(?:\.\d+)?)!4d(-?\d+(?:\.\d+))}
#   match = regex.match(google_maps_url)
# end

# def fetch_place(google_maps_url)
#   place_name = name_from_url(google_maps_url)
#   url = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=#{place_name}&inputtype=textquery&fields=formatted_address%2Cname%2Crating%2Copening_hours%2Cgeometry%2Cphotos&key=#{ENV['API_KEY']}"

#   result_serialized = URI.open(url).read
#   result = JSON.parse(result_serialized)
#   place = result["candidates"].first
#   formatted_address = place["formatted_address"]
#   long = lat_long_form_url(google_maps_url)[2].to_f
#   lat = lat_long_form_url(google_maps_url)[1].to_f
#   rating = place["rating"]
#   photo_ref = place["photos"].first["photo_reference"]
#   photo_url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=#{photo_ref}&key=#{ENV['API_KEY']}"

#   {
#     name: place_name,
#     address: formatted_address,
#     rating: rating,
#     photo_url: photo_url,
#     longitude: long,
#     latitude: lat
#   }
# end

# restaurant_urls = ['https://www.google.pl/maps/place/Toyoda+Cheesesteak/@35.6765512,139.6730251,17z/data=!3m1!4b1!4m5!3m4!1s0x6018f3f0b37b6971:0xd743de5aafbdf25f!8m2!3d35.6765521!4d139.6752074', 'https://www.google.pl/maps/place/440+Broadway+Taco+Shop/@35.6470831,139.714044,17z/data=!3m1!4b1!4m5!3m4!1s0x60188b952a357e9b:0xf7eeaebe3f5d3a7d!8m2!3d35.6470788!4d139.7162327', 'https://www.google.pl/maps/place/Shango/@35.6015794,139.7065851,17z/data=!3m2!4b1!5s0x60188abc5212fd73:0x476135a128d88401!4m5!3m4!1s0x60188abc53070001:0x15cd65744b931c13!8m2!3d35.6015751!4d139.7087738', 'https://www.google.pl/maps/place/Swan+%26+Lion/@35.6922773,139.7404285,17z/data=!3m1!4b1!4m5!3m4!1s0x60188c6884115fdf:0x83b6c3683e694f4b!8m2!3d35.692273!4d139.7426172', 'https://www.google.pl/maps/place/Mash+Bros/@35.698766,139.6953976,17z/data=!3m2!4b1!5s0x60188e34181f54e3:0x2ef6dc2af7c7758!4m5!3m4!1s0x60188deda6c30e6f:0x249b603c26a5f41e!8m2!3d35.6987617!4d139.6975863', 'https://www.google.pl/maps/place/Umami+Burger+Aoyama+Shop/@35.5772203,139.5845349,11z/data=!4m9!1m2!2m1!1sUmami+Burger!3m5!1s0x60188ca06783d2f3:0x74ee257b34cb0b04!8m2!3d35.6644638!4d139.709373!15sCgxVbWFtaSBCdXJnZXIiA4gBAVoOIgx1bWFtaSBidXJnZXKSARRoYW1idXJnZXJfcmVzdGF1cmFudA']

# Place.destroy_all
# puts "Creating seeds"

# restaurant_urls.each do |restaurant_url|
#   place_data = fetch_place(restaurant_url)
#   place_data[:url] = restaurant_url
#   Place.create!(place_data)
#   puts "#{place_data[:name]} created"
# end


# Place.create!{
#   name:,
#   address:,
#   rating:,
#   photo_url:,
#   longitude:,
#   latitude:,
#   maps_url:,
#   type:
# }

Place.destroy_all

# Restaurants

Place.create!({
  name:"Toyoda Cheesesteak",
  address:"〒151-0072 Tokyo, Shibuya City, Hatagaya, 1 Chome−4−1 花ビル 1F",
  photo_url: "https://www.heinz.co.jp/wp-content/uploads/2020/06/toyoda_001-1.jpg",
  url:"https://www.google.com/maps/place/Toyoda+Cheesesteak/@35.6765326,139.6751098,14z/data=!4m5!3m4!1s0x6018f3f0b37b6971:0xd743de5aafbdf25f!8m2!3d35.6765521!4d139.6752074",
  cuisine: "American",
  supermarket: "no"
})

Place.create!({
  name:"440 Broadway Taco Shop",
  address:"〒150-0013 Tokyo, Shibuya City, Ebisu, 1 Chome−25−3 レジデンサプリマベェラァ201",
  photo_url: "https://imageproxy.wolt.com/venue/600f78726cc7a2599f5882a4/542f854a-605f-11eb-9e7e-0aa00ca068f7_440broadwaytaco_group_1.jpg",
  url:"https://www.google.com/maps/place/440+Broadway+Taco+Shop/@35.6470831,139.714044,17z/data=!3m1!4b1!4m5!3m4!1s0x60188b952a357e9b:0xf7eeaebe3f5d3a7d!8m2!3d35.6470788!4d139.7162327",
  cuisine: "Mexican",
  supermarket: "no"
})

Place.create!({
  name:"Shango",
  address:"〒142-0053 Tokyo, Shinagawa City, Nakanobu, 5 Chome−13−16 パープルビル 2F",
  photo_url: "https://fastly.4sqi.net/img/general/600x600/7141012_t1ZroVVQQU67G0p1p8en19SmNtNCETxIE0Kgb1veG4w.jpg",
  url:"https://www.google.com/maps/place/Shango/@35.6015751,139.7065851,17z/data=!3m2!4b1!5s0x60188abc5212fd73:0x476135a128d88401!4m5!3m4!1s0x60188abc53070001:0x15cd65744b931c13!8m2!3d35.6015751!4d139.7087738",
  cuisine: "Cuban",
  supermarket: "no"
})

Place.create!({
  name:"Swan & Lion",
  address:"3 Chome-5-4 Kudanminami, Chiyoda City, Tokyo 102-0074",
  photo_url: "https://media.timeout.com/images/103081382/image.jpg",
  url:"https://www.google.com/maps/place/Swan+%26+Lion/@35.692273,139.7404285,17z/data=!3m2!4b1!5s0x60188c688414b1b5:0x36e81c670c993809!4m5!3m4!1s0x60188c6884115fdf:0x83b6c3683e694f4b!8m2!3d35.692273!4d139.7426172",
  cuisine: "British",
  supermarket: "no"
})

Place.create!({
  name:"Mash Bros",
  address:"〒169-0073 Tokyo, Shinjuku City, Hyakunincho, 1 Chome−24−8 2F A1 Shinjuku Town Plaza",
  photo_url: "https://imgfp.hotp.jp/IMGH/83/11/P036098311/P036098311_480.jpg",
  url:"https://www.google.com/maps/place/Mash+Bros/@35.6987617,139.6953976,17z/data=!3m2!4b1!5s0x60188e34181f54e3:0x2ef6dc2af7c7758!4m5!3m4!1s0x60188deda6c30e6f:0x249b603c26a5f41e!8m2!3d35.6987617!4d139.6975863",
  cuisine: "British",
  supermarket: "no"
})

Place.create!({
  name:"Umami Burger",
  address:"3 Chome-15-5 Kitaaoyama, Minato City, Tokyo 107-0061",
  photo_url: "https://media.gqjapan.jp/photos/5d27a4666f4b0f00089ac37c/master/pass/eye-1.jpg",
  url:"https://www.google.com/maps/place/Umami+Burger+Aoyama+Shop/@35.5772203,139.5845343,11z/data=!4m9!1m2!2m1!1sumami+burger!3m5!1s0x60188ca06783d2f3:0x74ee257b34cb0b04!8m2!3d35.6644638!4d139.709373!15sCgx1bWFtaSBidXJnZXIiA4gBAVoOIgx1bWFtaSBidXJnZXKSARRoYW1idXJnZXJfcmVzdGF1cmFudA",
  cuisine: "American",
  supermarket: "no"
})

Place.create!({
  name:"NEW NEW YORK CLUB",
  address:"3 Chome-8-5 Azabujuban, Minato City, Tokyo 106-0045",
  photo_url: "https://img.hanako.tokyo/2017/04/W5A0887-768x584.jpg",
  url:"https://www.google.com/maps/place/NEW+NEW+YORK+CLUB+BAGEL+%26+SANDWICH+SHOP/@35.6533448,139.7343992,17z/data=!4m12!1m6!3m5!1s0x60188ba04c144011:0x6da4b0a3f08ebecd!2sNEW+NEW+YORK+CLUB+BAGEL+%26+SANDWICH+SHOP!8m2!3d35.6533448!4d139.7343992!3m4!1s0x60188ba04c144011:0x6da4b0a3f08ebecd!8m2!3d35.6533448!4d139.7343992",
  cuisine: "American",
  supermarket: "no"
})

Place.create!({
  name:"Sanita",
  address:"〒151-0066 Tokyo, Shibuya City, Nishihara, 2 Chome−27−4 4 1F 1F",
  photo_url: "https://www.tokyoweekender.com/wp-content/uploads/2021/07/Sanita-Tokyo-7.jpg",
  url:"https://www.google.com/maps/place/Sanita/@35.5896161,139.5078524,11z/data=!3m1!5s0x6018f33bb335683b:0x11e27fa3a39093c1!4m9!1m2!2m1!1ssanita!3m5!1s0x6018f392fce7d1db:0x7a38de6783868782!8m2!3d35.6752259!4d139.6783563!15sCgZzYW5pdGFaCCIGc2FuaXRhkgEDYmFy",
  cuisine: "American",
  supermarket: "no"
})

Place.create!({
  name:"Freeman Shokudo",
  address:"2 Chome-27-4 Nishihara, Shibuya City, Tokyo 151-0066",
  photo_url: "https://media.timeout.com/images/105788919/image.jpg",
  url:"https://www.google.com/maps/place/Freeman+Shokudo/@35.6752687,139.6762402,17z/data=!3m2!4b1!5s0x6018f33bb335683b:0x11e27fa3a39093c1!4m5!3m4!1s0x6018f36ed0027493:0x1455719901baf0f0!8m2!3d35.6752644!4d139.6784289",
  cuisine: "American",
  supermarket: "no"
})

# Supermarkets

Place.create!({
  name:"Kyodai Market",
  address:"〒141-0022 Tokyo, Shinagawa City, Higashigotanda, 1 Chome−13−12 いちご五反田ビル 6F",
  photo_url: "https://lh3.googleusercontent.com/-OaBwk-DIG3k/XqFxnPFWo0I/AAAAAAAAANI/nz066__v2h0q2kz1REWKcl0WTAcuvwSSACLIBGAYYCw/w768-h768-n-o-k-v1/",
  url:"https://www.google.com/maps/place/Kyodai+Market/@35.6267065,139.7222895,17z/data=!3m2!4b1!5s0x60188afba19e61ff:0x8759fe3153b0f126!4m5!3m4!1s0x60188afba0539b95:0x2626a524638d7004!8m2!3d35.6267022!4d139.7244782",
  cuisine: "Brazilian, Mexican",
  supermarket: "yes"
})

Place.create!({
  name:"Nikko Asia Shokuin",
  address:"〒2-4F, 1-37-2 Nishi-Ikebukuro, Toshima-ku, Tokyo",
  photo_url: "https://a1.cdn.japantravel.com/photo/61330-210032/840x560!/tokyo-nikko-asia-shokuhin-210032.jpg",
  url:"https://www.google.com/maps/place/Asia+Foods/@35.7587033,139.6923363,17z/data=!3m1!4b1!4m5!3m4!1s0x601892d271cc7bbf:0x40c349b9e0a7c459!8m2!3d35.7586464!4d139.6945456",
  cuisine: "Taiwanese",
  supermarket: "yes"
})

Place.create!({
  name:"Seijo Ishii",
  address:"1 Chome-9-1 Marunouchi, Chiyoda City, Tokyo 100-0005",
  photo_url: "https://www.seijoishii.co.jp/en/img/index_menu_02.png",
  url:"https://www.google.com/maps/place/SEIJO+ISHII+GrandGate+Tokyo+Station/@35.7590342,139.5544385,11z/data=!3m1!5s0x60188bfbd91993eb:0x73e0693562fc525a!4m9!1m2!2m1!1sseijo+ishi+tokyo!3m5!1s0x60188bfb3798ba39:0x589e960173c26966!8m2!3d35.6775397!4d139.7652081!15sChBzZWlqbyBpc2hpIHRva3lvWhIiEHNlaWpvIGlzaGkgdG9reW-SAQ1ncm9jZXJ5X3N0b3Jl",
  cuisine: "International",
  supermarket: "yes"
})

Place.create!({
  name:"Ambika",
  address:"〒111-0051 Tokyo, Taito City, Kuramae, 3 Chome−19−2 アンビカハウス1F",
  photo_url: "https://cdn.shopify.com/s/files/1/0538/0243/4760/files/Ambikashop_KURAMAE_640x.jpg?v=1636357060",
  url:"https://www.google.com/maps/place/Ambika+Veg+%26+Vegan+Shop+Kuramae/@35.7053751,139.791196,17z/data=!4m12!1m6!3m5!1s0x60188eb8280eb47f:0x1506727694c76714!2sAmbika+Veg+%26+Vegan+Shop+Kuramae!8m2!3d35.7054169!4d139.791268!3m4!1s0x60188eb8280eb47f:0x1506727694c76714!8m2!3d35.7054169!4d139.791268",
  cuisine: "Indian",
  supermarket: "yes"
})

Place.create!({
  name:"Darvish",
  address:"〒103-0001 Tokyo, Chuo City, 18, 日本橋小伝馬町１８−４上野ビル１F",
  photo_url: "https://soranews24.com/wp-content/uploads/sites/3/2021/07/DV-4.jpg?w=640",
  url:"https://www.google.com/maps/place/Darvish/@35.7054985,139.7233442,12z/data=!3m1!5s0x60188eac95027171:0x139b01389577657!4m9!1m2!2m1!1sdarvish!3m5!1s0x60188eac94f93625:0xf6226f19e626a84b!8m2!3d35.6924701!4d139.7791642!15sCgdkYXJ2aXNoWgkiB2RhcnZpc2iSARNhc2lhbl9ncm9jZXJ5X3N0b3Jl",
  cuisine: "Indian",
  supermarket: "yes"
})

Place.create!({
  name:"Nissin World Delicatessen",
  address:"〒2 Chome-32-13 Higashiazabu, Minato City, Tokyo 106-0044",
  photo_url: "https://resources.realestate.co.jp/wp-content/uploads/2017/10/Cheese-Selection-at-Nissin-World-Delicatessen-Higashi-Azabu-Tokyo-2.jpeg",
  url:"https://www.google.com/maps/place/Darvish/@35.7054985,139.7233442,12z/data=!3m1!5s0x60188eac95027171:0x139b01389577657!4m9!1m2!2m1!1sdarvish!3m5!1s0x60188eac94f93625:0xf6226f19e626a84b!8m2!3d35.6924701!4d139.7791642!15sCgdkYXJ2aXNoWgkiB2RhcnZpc2iSARNhc2lhbl9ncm9jZXJ5X3N0b3Jl",
  cuisine: "International",
  supermarket: "yes"
})

puts "Seeds compiled"
puts "#{Place.all.count} places added"
