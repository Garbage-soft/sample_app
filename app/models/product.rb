class Product < ApplicationRecord
  has_many_attached :image
  validates :name, presence: true
end
