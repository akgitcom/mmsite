class Product < ActiveRecord::Base
  self.primary_key = 'pid'
  # belongs_to :article,
  #            :class_name => "Article",
  #            :foreign_key => "product_id"
  belongs_to :category ,foreign_key: "cid"# 單數
  has_and_belongs_to_many :articles
  mount_uploader :avatar, ProductUploader

end
