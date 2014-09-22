class Ckeditor::Asset < ActiveRecord::Base
  include Ckeditor::Orm::ActiveRecord::AssetBase

  self.abstract_class = true
  self.table_name_prefix = 'j_'
  delegate :url, :current_path, :content_type, :to => :data

  validates_presence_of :data
end
