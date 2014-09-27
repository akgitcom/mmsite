class Ckeditor::Picture < Ckeditor::Asset
  # self.abstract_class = true
  self.table_name_prefix = 'j_'
  mount_uploader :data, CkeditorPictureUploader, :mount_on => :data_file_name

  def url_content
    url(:content)
  end
end
