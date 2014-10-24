class Article < ActiveRecord::Base
  self.primary_key = 'aid'
  has_and_belongs_to_many :products
  mount_uploader :img ,ArticleUploader
end
