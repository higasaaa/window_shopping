# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者ログイン情報
  Admin.create!(email: 'admin@admin.com', password: 'window')
  puts "adminを作成しました"

# 顧客データ
  5.times do |n|
    Customer.create!(
      email: "customer#{n + 1}@customer.com",
      password: "password#{n + 1}",
      password_confirmation: "password#{n + 1}",
      nickname: "ニックネーム#{n + 1}",
      birthdate: "1990-01-#{n + 1}",
      sex: "女性",
      live_area: "東京都"
    )
  end

  puts "customerを作成しました"

# タグ
  Tag.create!(
    [
      {tag_name: '#feminine'},
      {tag_name: '#cute'},
      {tag_name: '#casual'},
      {tag_name: '#mode'},
      {tag_name: '#cool'}
    ]
  )
  puts "tagを作成しました"

# コーディネートの投稿
  Coordinate.create!(
    [
      {tag_id: Tag.all[0].id, total_price: 8000, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-coordinate1.jpg"), filename:"sample-coordinate1.jpg"), coordinates_description: '美しいシルエットを描くフィット感ロングワンピースです。また、上質な生地の持つ着心地感とスタイルアップをサポートしてくれるオススメアイテムです。'},
      {tag_id: Tag.all[1].id, total_price: 10000, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-coordinate2.jpg"), filename:"sample-coordinate2.jpg"), coordinates_description: '美しいシルエットを描くフィット感ロングワンピースです。また、上質な生地の持つ着心地感とスタイルアップをサポートしてくれるオススメアイテムです。'},
      {tag_id: Tag.all[2].id, total_price: 12000, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-coordinate4.jpg"), filename:"sample-coordinate4.jpg"), coordinates_description: '美しいシルエットを描くフィット感ロングワンピースです。また、上質な生地の持つ着心地感とスタイルアップをサポートしてくれるオススメアイテムです。'},
      {tag_id: Tag.all[3].id, total_price: 7000, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-coordinate3.jpg"), filename:"sample-coordinate3.jpg"), coordinates_description: '美しいシルエットを描くフィット感ロングワンピースです。また、上質な生地の持つ着心地感とスタイルアップをサポートしてくれるオススメアイテムです。'},
    ]
  )
  puts "coordinateを作成しました"

  20.times do |n|
    time = Time.now - rand(2).month #現在から２ヶ月前まで

    customer_id = rand(5) + 1 # ユーザー増えたときはrandを変更
    coordinate_id = rand(4) + 1 # コーディネートの数が増えたときは、randを変更

    favorite = Favorite.find_by(customer_id: customer_id, coordinate_id: coordinate_id) #カスタマーとコーデんを探してnilだった場合下記を実行する

    if favorite.nil?
      Favorite.create!(
        customer_id: customer_id,
        coordinate_id: coordinate_id,
        created_at: time,
        updated_at: time
      )
    end
  end