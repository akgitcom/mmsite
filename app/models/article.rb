class Article < ActiveRecord::Base
  self.primary_key = 'aid'
  # has_many :products,
  #          :class_name => "Product",
  #          :foreign_key => "article_id"
  has_and_belongs_to_many :products

  after_save :reload_routes

  def reload_routes
    DynamicRouter.reload
  end
end
