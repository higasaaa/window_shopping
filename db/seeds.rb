
# 管理者ログイン情報
  Admin.create!(email: 'admin@admin.com', password: 'window')
  puts "adminを作成しました"

# 顧客データ
  10.times do |n|
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
      {tag_id: Tag.all[0].id, total_price: 8000, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-coordinate1.jpg"), filename:"sample-coordinate1.jpg"), coordinates_description: '美しいシルエットを描くフィット感ロングワンピースです。また、上質な生地の持つ着心地感とスタイルアップをサポートしてくれるおすすめアイテムです。'},
      {tag_id: Tag.all[1].id, total_price: 10000, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-coordinate2.jpg"), filename:"sample-coordinate2.jpg"), coordinates_description: 'シースルーのトップスが女らしさをUPさせてくれます。パンツは裾幅が広めなので美脚に見せてくれるおすすめのコーディネートです。'},
      {tag_id: Tag.all[2].id, total_price: 12000, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-coordinate4.jpg"), filename:"sample-coordinate4.jpg"), coordinates_description: 'トップスがエレガントさを演出してくれます。ハイウエストパンツと合わせることで足長効効果が期待できるおすすめのコーディネートです。'},
      {tag_id: Tag.all[3].id, total_price: 7000, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-coordinate3.jpg"), filename:"sample-coordinate3.jpg"), coordinates_description: '美しいシルエットを描くフィット感ロングワンピースです。ドット柄が可愛らしいですが上品な雰囲気を持つおすすめのアイテムです。'},
      {tag_id: Tag.all[0].id, total_price: 8000, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-coordinate5.jpg"), filename:"sample-coordinate5.jpg"), coordinates_description: 'ゆったりシルエットの体型をカバーしてくれるワンピースです。襟元のフリルが可愛らし印象にしてくれるおすすめのコーディネートです。'},
      {tag_id: Tag.all[3].id, total_price: 9000, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-coordinate6.jpg"), filename:"sample-coordinate6.jpg"), coordinates_description: '胸元の切り替えのフリルが印象的なブラウス、デニムパンツを合わせることによってカジュアルダウンをしたおすすめのコーディネートです。'},
      {tag_id: Tag.all[3].id, total_price: 13000, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-coordinate7.jpg"), filename:"sample-coordinate7.jpg"), coordinates_description: '全身黒で揃えたモード感漂うコーディネートです。シンプルなので色々なアイテムに着回しが効いて使い勝手が◎のおすすめのコーディネートです。'},
      {tag_id: Tag.all[4].id, total_price: 12000, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-coordinate8.jpg"), filename:"sample-coordinate8.jpg"), coordinates_description: 'オーバーサイズシルエットのチェック柄のセットアップです。インナーは肌が少し見えるのがポイントです。着回しがきくおすすめのコーディネートです。'},
      {tag_id: Tag.all[3].id, total_price: 13000, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-coordinate9.jpg"), filename:"sample-coordinate9.jpg"), coordinates_description: 'フリル、袖口がポイントのブラウスです。パンツは、着丈が少し短めなので足元がスッキリした印象になります。'}
    ]
  )
  puts "coordinateを作成しました"

# いいねのデータ
  20.times do |n|
    time = Time.now - rand(2).month 

    customer_id = rand(10) + 1
    coordinate_id = rand(9) + 1

    favorite = Favorite.find_by(customer_id: customer_id, coordinate_id: coordinate_id)

    if favorite.nil?
      Favorite.create!(
        customer_id: customer_id,
        coordinate_id: coordinate_id,
        created_at: time,
        updated_at: time
      )
    end
  end




