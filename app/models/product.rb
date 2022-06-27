class Product < ApplicationRecord
  has_many_attached :image
  validates :name, presence: true
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "正しい画像形式ではありません。" },
                      size:         { less_than: 5.megabytes,
                                      message: "アップロードする画像は5MB以下でなければなりません。" }
end
