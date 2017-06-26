class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :stock, presence: true
  mount_uploader :image, ImageUploader
  has_many :comments
end
