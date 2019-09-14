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
             
20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@sample.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:  password)
end


Favorite.create!(number:322536,name:"ホテルメトロポリタンエドモント",memo:"価格が少し高いのが難点だが,部屋の内装が豪華で従業員の接客も親切でとてもよかった。あと,食事も豪華で美味しく、駅から近くアクセスもよい。
                                                                           とてもいい1日を過ごせました。また機会を見つけて、是非利用したいと思います。",user_id:2);
Favorite.create!(number:322305,name:"ホテルグランドパレス（HOTEL　GRAND　PALACE）",
                  memo:"価格がとてもリーズブルだったが,やや駅から遠いのが難点",user_id:2);
Favorite.create!(number:397528,name:"SAKU　REN　JIMBOCHO(サクレン神保町)",
                  memo:"部屋が清潔感にあふれていたがその割に価格がよかった",user_id:2);
                  
Favorite.create!(number:305158,name:"ＫＫＲホテル東京（国家公務員共済組合連合会東京共済会館）",memo:"価格が少し高いのが難点だが,部屋の内装が豪華で従業員の接客も親切でとてもよかった。あと,食事も豪華で美味しく、駅から近くアクセスもよい。
                                                                           とてもいい1日を過ごせました。また機会を見つけて、是非利用したいと思います。",user_id:2);
Favorite.create!(number:316850,name:"ナインアワーズ大手町（旧：竹橋）",
                  memo:"価格がとてもリーズブルだったが,やや駅から遠いのが難点",user_id:2);
Favorite.create!(number:314177,name:"東京グリーンホテル後楽園",
                  memo:"部屋が清潔感にあふれていたがその割に価格がよかった",user_id:2);
                  
Favorite.create!(number:397528,name:"SAKU　REN　JIMBOCHO(サクレン神保町)",
                  memo:"部屋が清潔感にあふれていたがその割に価格がよかった",user_id:3);
                  

Post.create!(number:322536,name:"ホテルメトロポリタンエドモント",comment:"価格が少し高いのが難点だが,部屋の内装が豪華で従業員の接客も親切でとてもよかった。あと,食事も豪華で美味しく、駅から近くアクセスもよい。
                                                                           とてもいい1日を過ごせました。また機会を見つけて、是非利用したいと思います。",user_id:2);
Post.create!(number:322305,name:"ホテルグランドパレス（HOTEL　GRAND　PALACE）",
                  comment:"価格がとてもリーズブルだったが,やや駅から遠いのが難点",user_id:2);
Post.create!(number:397528,name:"SAKU　REN　JIMBOCHO(サクレン神保町)",
                  comment:"部屋が清潔感にあふれていたがその割に価格がよかった",user_id:2);
                  
Post.create!(number:316850,name:"ナインアワーズ大手町（旧：竹橋）",comment:"価格が少し高いのが難点だが,部屋の内装が豪華で従業員の接客も親切でとてもよかった。あと,食事も豪華で美味しく、駅から近くアクセスもよい。
                                                                           とてもいい1日を過ごせました。また機会を見つけて、是非利用したいと思います。",user_id:2);
Post.create!(number:314177,name:"東京グリーンホテル後楽園",
                  comment:"価格がとてもリーズブルだったが,やや駅から遠いのが難点",user_id:2);
Post.create!(number:305158,name:"ＫＫＲホテル東京（国家公務員共済組合連合会東京共済会館）",
                  comment:"部屋が清潔感にあふれていたがその割に価格がよかった",user_id:2);
                  
Post.create!(number:397528,name:"SAKU　REN　JIMBOCHO(サクレン神保町)",
                  comment:"部屋が清潔感にあふれていたがその割に価格がよかった",user_id:3);      