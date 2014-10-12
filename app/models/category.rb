class Category < ActiveRecord::Base
  extend ActsAsTree::TreeWalker
  acts_as_tree :order => "title"

  self.primary_key = 'id'
  mount_uploader :img ,CategoryUploader
  after_save :reload_routes
  has_many :products,foreign_key: "category" # 複數 #category 是products表中存储的Category的cid
  def reload_routes
    DynamicRouter.reload
  end
end
