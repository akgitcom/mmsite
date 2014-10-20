class Category < ActiveRecord::Base
  acts_as_nested_set
  self.primary_key = 'id'

  has_many :products,foreign_key: "category_id" # 複數 #category 是products表中存储的Category的cid
  mount_uploader :img ,CategoryUploader

  after_save :reload_routes
  def reload_routes
    DynamicRouter.reload
  end
end
