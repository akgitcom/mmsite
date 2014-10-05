class Category < ActiveRecord::Base
  include ActsAsTree
  acts_as_tree :order => "title"
  acts_as_tree :foreign_key =>'pid'

  self.primary_key = 'cid'
  mount_uploader :img ,CategoryUploader
  after_save :reload_routes
  has_many :products,foreign_key: "category" # 複數 #category 是products表中存储的Category的cid
  def reload_routes
    DynamicRouter.reload
  end
  def leaf
    unknown? || children_count == 0
  end

  def to_json_with_leaf(options = {})
    self.to_json_without_leaf(options.merge(:methods => :leaf))
  end

  alias_method_chain :to_json, :leaf
end
