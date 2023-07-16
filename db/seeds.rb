# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email: "admin@camp.jp", password: "fourcamp", password_confirmation: "fourcamp")

Prefecture.create(prefecture_name: "北海道")
Prefecture.create(prefecture_name: "青森県")
Prefecture.create(prefecture_name: "岩手県")
Prefecture.create(prefecture_name: "宮城県")
Prefecture.create(prefecture_name: "秋田県")
Prefecture.create(prefecture_name: "山形県")
Prefecture.create(prefecture_name: "福島県")
Prefecture.create(prefecture_name: "茨城県")
Prefecture.create(prefecture_name: "栃木県")
Prefecture.create(prefecture_name: "群馬県")
Prefecture.create(prefecture_name: "埼玉県")
Prefecture.create(prefecture_name: "千葉県")
Prefecture.create(prefecture_name: "東京都")
Prefecture.create(prefecture_name: "神奈川県")
Prefecture.create(prefecture_name: "新潟県")
Prefecture.create(prefecture_name: "富山県")
Prefecture.create(prefecture_name: "石川県")
Prefecture.create(prefecture_name: "福井県")
Prefecture.create(prefecture_name: "山梨県")
Prefecture.create(prefecture_name: "長野県")
Prefecture.create(prefecture_name: "岐阜県")
Prefecture.create(prefecture_name: "静岡県")
Prefecture.create(prefecture_name: "愛知県")
Prefecture.create(prefecture_name: "三重県")
Prefecture.create(prefecture_name: "滋賀県")
Prefecture.create(prefecture_name: "京都府")
Prefecture.create(prefecture_name: "大阪府")
Prefecture.create(prefecture_name: "兵庫県")
Prefecture.create(prefecture_name: "奈良県")
Prefecture.create(prefecture_name: "和歌山県")
Prefecture.create(prefecture_name: "鳥取県")
Prefecture.create(prefecture_name: "島根県")
Prefecture.create(prefecture_name: "岡山県")
Prefecture.create(prefecture_name: "広島県")
Prefecture.create(prefecture_name: "山口県")
Prefecture.create(prefecture_name: "徳島県")
Prefecture.create(prefecture_name: "香川県")
Prefecture.create(prefecture_name: "愛媛県")
Prefecture.create(prefecture_name: "高知県")
Prefecture.create(prefecture_name: "福岡県")
Prefecture.create(prefecture_name: "佐賀県")
Prefecture.create(prefecture_name: "長崎県")
Prefecture.create(prefecture_name: "熊本県")
Prefecture.create(prefecture_name: "大分県")
Prefecture.create(prefecture_name: "宮崎県")
Prefecture.create(prefecture_name: "鹿児島県")
Prefecture.create(prefecture_name: "沖縄県")

CampsiteType.create(type_name: "高原")
CampsiteType.create(type_name: "海辺")
CampsiteType.create(type_name: "河原")
CampsiteType.create(type_name: "林間")
CampsiteType.create(type_name: "湖畔")

Season.create(season_name: "春")
Season.create(season_name: "夏")
Season.create(season_name: "秋")
Season.create(season_name: "冬")

15.times do |n|
  Member.create!(
  email: "test#{n + 1}camp@camp",
  name: "試作#{n + 1}号",
  name_ruby: "しさく#{n + 1}ごう",
  nickname: "テスト#{n + 1}",
  password: "test#{n + 1}camp",
  password_confirmation: "test#{n + 1}camp")
end

Member.create(
  email: "test16camp@camp",
  name: "試作16号",
  name_ruby: "しさく16ごう",
  nickname: "テスト16",
  password: "test16camp",
  password_confirmation: "test16camp",
  profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-member1.jpg"),filename: "sample-member1.jpg")
  )

  Campsite.create(
    campsite_type_id: 1,
    prefecture_id: 1,
    name: "オートリゾート 苫小牧アルテン",
    address: "北海道苫小牧市樽前421-4",
    phone_number: "00011111111",
    route: "テスト駅からテスト町行バスへ乗り徒歩1分",
    feature: "各季節で限定のイベントを行っています！去年の夏はバーベキューで大いに盛り上がりました！！",
    considerations: "毎年夏から秋にかけてクマの目撃情報が寄せられています。クマよけの鈴を配布していますので、お持ちでない方はカウンターまでお越しください。",
    )

  Campsite.create(
    campsite_type_id: 1,
    prefecture_id: 1,
    name: "安平町ときわキャンプ場",
    address: "北海道勇払郡安平町早来北進98-45",
    phone_number: "00011111111",
    route: "札幌から1時間弱、新千歳空港から車でわずか30分",
    feature: "各季節で限定のイベントを行っています！去年の夏はバーベキューで大いに盛り上がりました！！",
    considerations: "毎年夏から秋にかけてクマの目撃情報が寄せられています。クマよけの鈴を配布していますので、お持ちでない方はカウンターまでお越しください。",
    )

  Campsite.create(
    campsite_type_id: 1,
    prefecture_id: 1,
    name: "穂別キャンプ場",
    address: "北海道勇払郡むかわ町穂別稲里553番地穂別キャンプ場センターハウス",
    phone_number: "00011111111",
    route: "高速自動車道・むかわ穂別ICより車で約１１分",
    feature: "各季節で限定のイベントを行っています！去年の夏はバーベキューで大いに盛り上がりました！！",
    considerations: "毎年夏から秋にかけてクマの目撃情報が寄せられています。クマよけの鈴を配布していますので、お持ちでない方はカウンターまでお越しください。",
    )

  Campsite.create(
    campsite_type_id: 1,
    prefecture_id: 1,
    name: "さらべつカントリーパーク",
    address: "北海道河西郡更別村弘和541番地62",
    phone_number: "00011111111",
    route: "新千歳空港→約3時間30分",
    feature: "各季節で限定のイベントを行っています！去年の夏はバーベキューで大いに盛り上がりました！！",
    considerations: "毎年夏から秋にかけてクマの目撃情報が寄せられています。クマよけの鈴を配布していますので、お持ちでない方はカウンターまでお越しください。",
    )

  Campsite.create(
    campsite_type_id: 1,
    prefecture_id: 1,
    name: "ニセコボンゴ広場",
    address: "北海道虻田郡ニセコ町曽我863-12ボンゴ広場",
    phone_number: "00011111111",
    route: "倶知安町方面から道道３４３号線を通って来る場合、写真の点滅信号まで来ましたらそのまま通り過ぎてください。点滅信号を過ぎて１００メールほど進んだ右側にボンゴ広場があります。",
    feature: "各季節で限定のイベントを行っています！去年の夏はバーベキューで大いに盛り上がりました！！",
    considerations: "毎年夏から秋にかけてクマの目撃情報が寄せられています。クマよけの鈴を配布していますので、お持ちでない方はカウンターまでお越しください。",
    )

  Campsite.create(
    campsite_type_id: 1,
    prefecture_id: 1,
    name: "層雲峡オートキャンプ場",
    address: "北海道上川郡上川町層雲峡清川",
    phone_number: "00011111111",
    route: "JR石北本線「旭川駅」から車で約1時間15分",
    feature: "各季節で限定のイベントを行っています！去年の夏はバーベキューで大いに盛り上がりました！！",
    considerations: "毎年夏から秋にかけてクマの目撃情報が寄せられています。クマよけの鈴を配布していますので、お持ちでない方はカウンターまでお越しください。",
    )

Campsite.create(
    prefecture_id: 4,
    campsite_type_id: 2,
    name: "エコキャンプみちのく",
    address: "宮城県柴田郡川崎町大字川内字向原254番地エコキャンプみちのく",
    phone_number: "654000011111",
    route: "仙台宮城IC～宮城川崎IC …… 約20分",
    feature: "各季節で限定のイベントを行っています！去年の夏はバーベキューで大いに盛り上がりました！！",
    considerations: "毎年夏から秋にかけてクマの目撃情報が寄せられています。クマよけの鈴を配布していますので、お持ちでない方はカウンターまでお越しください。",
    campsite_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-campsite1.jpg"),filename: "sample-campsite1.jpg")
  )

10.times do |n|
  review = Review.new(
    member_id: 1,
    campsite_id: 1,
    title: "テストレビュー#{n + 1}",
    star: 4.0,
    season_id: 1,
    comment: "気温が高かったが、風があったので快適に過ごせましたが、強風対策は必須です。"
    )
  tag_list = ["強風"]
  review.save
  review.save_tags(tag_list)
end

1.times do |n|
  review = Review.new(
    member_id: 1,
    campsite_id: 1,
    title: "テストレビュー11",
    star: 4.0,
    season_id: 2,
    comment: "気温が高かったが、風があったので快適に過ごせましたが、強風対策は必須です。",
    review_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-review1.jpg"),filename: "sample-review1.jpg")
    )
  tag_list = ["夏日"]
  review.save
  review.save_tags(tag_list)
end

15.times do |n|
  Contact.create(
    member_id: 1,
    subject: "テストお問い合わせ#{n + 1}",
    demand: "テストお問い合わせ#{n + 1}テストお問い合わせ#{n + 1}テストお問い合わせ#{n + 1}テストお問い合わせ#{n + 1}"
    )
end
