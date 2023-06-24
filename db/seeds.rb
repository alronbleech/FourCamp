# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email: "admin@co.jp", password: "fourcamp", password_confirmation: "fourcamp")

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

15.times do |n|
  Member.create(email: "test{n}camp@camp", name: "試作{n}号", name_ruby: "しさく{n}ごう", nickname: "テスト{n}",password: "test{n}camp", password_confirmation: "test{n}camp")
end

target_prefecture = Prefecture.find_by(name: "熊本県") #県名の中から熊本県を取得

10.times do |value , index|
  campsite = Campsite.new
  campsite.prefecture = target_prefecture
  name + index.to_s

  campsite.save
end

member= Member.create(...)
 #ここからレビュー作成時のseed
review = Review.new(title: "test1", :star, :comment, :review_image)
review.member_id = member.id
review.campsite_id = campsite.id


tag_list = "aki," #
review.save_tags(tag_list)

review.save
 #ここまでレビュー作成時のseed
contact