class Product < ActiveRecord::Base
  belongs_to :category ,foreign_key: "id"
  has_and_belongs_to_many :faqs
  has_and_belongs_to_many :articles
  has_many :photos, :inverse_of => :product, :dependent => :destroy
  mount_uploader :img, ProductUploader
end
