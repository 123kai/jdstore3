class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :category

  scope :recent, -> { order("created_at DESC") }

  # add to collection
  has_many :collection
  has_many :members, through: :collections, source: :user

  # comments
  has_many :comments 
end
