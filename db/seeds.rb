# メインの管理者ユーザーを1人作成する
User.create!(name:  "Administrator",
             email: "admin@example.com",
             password:              "footer",
             password_confirmation: "footer",
             admin: true)

# 管理者権限を持たない一般ユーザーを追加する
User.create!(name:  "Test User",
             email: "test@example.com",
             password:              "password",
             password_confirmation: "password")

# テスト用の商品を追加する
Product.create!(name: "テスト商品",
                price: "1000",
                stock: "1",
                description: "テスト用の商品")
