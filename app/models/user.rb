class User < ApplicationRecord

  # コールバックメソッド ===================================================
  # UserオブジェクトをDBへ保存する前に行う処理
  # emailを小文字に変換する
  before_save { email.downcase! }
  # =====================================================================

  # バリデーション ========================================================
  # 名前 　　　　　検証内容：　存在性、　長さ（最大50文字）
  validates :name,  presence: true, length: { maximum: 50 }

  # メールアドレスの形式を指定する定数（正規表現）
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # メールアドレス　検証内容：　存在性、　長さ（最大255文字）、
  #                        フォーマット(形式)、　一意性(大文字小文字を区別しない)
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  # gem BCrypt を導入することで使えるメソッド
  # ハッシュ化したパスワードをDB内のpassword_digestという属性に保存できるようになる
  # モデル内にpassword_digestという属性が含まれていなければこのメソッドは使用できない
  has_secure_password

  # パスワード　　　検証内容：　存在性、　長さ（最小2文字）
  validates :password, presence: true, length: { minimum: 2 }
  # =====================================================================
end
