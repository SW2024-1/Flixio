# db/seeds.rb

# サンプル動画1
product1 = Product.create(
  name: "サンプル動画1",
  price: 100
)
# 動画ファイルをbinaryとして保存
product1.update(file: File.open(Rails.root.join("public/videos/ex1_kamo.mp4")).read)

# サムネイル画像を添付
product1.thumbnail.attach(io: File.open(Rails.root.join("public/thumbnails/hero.png")), filename: "thumbnail1.png", content_type: "image/png")

# サンプル動画2
product2 = Product.create(
  name: "サンプル動画2",
  price: 200
)
# 動画ファイルをbinaryとして保存
product2.update(file: File.open(Rails.root.join("public/videos/ex2_chabatake.mp4")).read)

# サムネイル画像を添付
product2.thumbnail.attach(io: File.open(Rails.root.join("public/thumbnails/kaisou.png")), filename: "thumbnail2.png", content_type: "image/png")

# サンプル動画3
product3 = Product.create(
  name: "サンプル動画3",
  price: 300
)
# 動画ファイルをbinaryとして保存
product3.update(file: File.open(Rails.root.join("public/videos/ex1_kamo.mp4")).read)

# サムネイル画像を添付
product3.thumbnail.attach(io: File.open(Rails.root.join("public/thumbnails/kaisou.png")), filename: "thumbnail2.png", content_type: "image/png")

