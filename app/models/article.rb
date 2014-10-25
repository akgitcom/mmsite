class Article < ActiveRecord::Base
  self.primary_key = 'aid'

  validates_presence_of :title, :message => "Title can not be empty !"
  validates_presence_of :content, :message => "Content can not be empty !"
  validates_uniqueness_of :title, :case_sensitive => false, :message => "The <b>title</b> has been registered!"

  has_and_belongs_to_many :products
  mount_uploader :img ,ArticleUploader
end
