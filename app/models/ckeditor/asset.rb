class Ckeditor::Asset < ActiveRecord::Base
  # self.abstract_class = true
  self.table_name_prefix = 'j_'
  include Ckeditor::Orm::ActiveRecord::AssetBase
  delegate :url, :current_path, :content_type, :to => :data
  validates_presence_of :data
end
