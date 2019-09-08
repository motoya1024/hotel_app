# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "管理者",
             email: "admin@sample.com",
             password: "password",
             admin: true)
             
10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@sample.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:  password)
end


Favorite.create!(number:78211,name:"庭のホテル　東京",memo:"価格がとてもリーズブルだった",site:1,user_id:2);
Favorite.create!(number:4924,name:"ホテルグランドパレス（Hotel　Grand　Palace）",memo:"従業員の接客がとても親切だった",site:1,user_id:2);
Favorite.create!(number:391,name:"ホテルメトロポリタン　エドモント",memo:"部屋が清潔感にあふれていたがその割に価格がよかった",site:1,user_id:2);
Favorite.create!(number:4805,name:"東京ドームホテル",memo:"価格が少し高いのが難点だが,内装が豪華で接客もよかった。あと,駅から近いのもよい",site:1,user_id:2);
Favorite.create!(number:322536,name:"ホテルメトロポリタンエドモント",memo:"価格が少し高いのが難点だが,内装が豪華で接客もよかった。あと,駅から近いのもよい",site:2,user_id:2);
Favorite.create!(number:322305,name:"ホテルグランドパレス（HOTEL　GRAND　PALACE）",
                  memo:"価格がとてもリーズブルだったが,やや駅から遠いのが難点",site:2,user_id:2);
Favorite.create!(number:397528,name:"SAKU　REN　JIMBOCHO(サクレン神保町)",
                  memo:"部屋が清潔感にあふれていたがその割に価格がよかった",site:2,user_id:2);
                  
Favorite.create!(number:78211,name:"庭のホテル　東京",memo:"価格がとてもリーズブルだった",site:1,user_id:3);
Favorite.create!(number:4924,name:"ホテルグランドパレス（Hotel　Grand　Palace）",memo:"従業員の接客がとても親切だった",site:1,user_id:3);
Favorite.create!(number:391,name:"ホテルメトロポリタン　エドモント",memo:"部屋が清潔感にあふれていたがその割に価格がよかった",site:1,user_id:3);
Favorite.create!(number:397528,name:"SAKU　REN　JIMBOCHO(サクレン神保町)",
                  memo:"部屋が清潔感にあふれていたがその割に価格がよかった",site:2,user_id:2);
                  
Post.create!(number:78211,name:"庭のホテル　東京",comment:"価格がとてもリーズブルだった",site:1,user_id:2);
Post.create!(number:4924,name:"ホテルグランドパレス（Hotel　Grand　Palace）",comment:"従業員の接客がとても親切だった",site:1,user_id:2);
Post.create!(number:391,name:"ホテルメトロポリタン　エドモント",comment:"部屋が清潔感にあふれていたがその割に価格がよかった",site:1,user_id:2);
Post.create!(number:4805,name:"東京ドームホテル",comment:"価格が少し高いのが難点だが,内装が豪華で接客もよかった。あと,駅から近いのもよい",site:1,user_id:2);
Post.create!(number:322536,name:"ホテルメトロポリタンエドモント",comment:"価格が少し高いのが難点だが,内装が豪華で接客もよかった。あと,駅から近いのもよい",site:2,user_id:2);
Post.create!(number:322305,name:"ホテルグランドパレス（HOTEL　GRAND　PALACE）",
                  comment:"価格がとてもリーズブルだったが,やや駅から遠いのが難点",site:2,user_id:2);
Post.create!(number:397528,name:"SAKU　REN　JIMBOCHO(サクレン神保町)",
                  comment:"部屋が清潔感にあふれていたがその割に価格がよかった",site:2,user_id:2);
                  
Post.create!(number:78211,name:"庭のホテル　東京",comment:"価格がとてもリーズブルだった",site:1,user_id:3);
Post.create!(number:4924,name:"ホテルグランドパレス（Hotel　Grand　Palace）",comment:"従業員の接客がとても親切だった",site:1,user_id:3);
Post.create!(number:391,name:"ホテルメトロポリタン　エドモント",comment:"部屋が清潔感にあふれていたがその割に価格がよかった",site:1,user_id:3);
Post.create!(number:397528,name:"SAKU　REN　JIMBOCHO(サクレン神保町)",
                  comment:"部屋が清潔感にあふれていたがその割に価格がよかった",site:2,user_id:2);