class Photo < ActiveRecord::Base
  belongs_to	:product

  validates 	:product, presence: true
  mount_uploader :image, PhotoUploader
end