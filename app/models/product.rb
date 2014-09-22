class Product < ActiveRecord::Base
  self.primary_key = 'pid'
  # belongs_to :article,
  #            :class_name => "Article",
  #            :foreign_key => "product_id"
  has_and_belongs_to_many :articles

end
