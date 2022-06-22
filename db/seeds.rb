# メインの管理者ユーザーを1人作成する
User.create!(name:  "Administrator",
             email: "admin@example.com",
             password:              "footer",
             password_confirmation: "footer",
             admin: true)

User.create!(name:  "Test User",
             email: "test@example.com",
             password:              "password",
             password_confirmation: "password",
             admin: true)
