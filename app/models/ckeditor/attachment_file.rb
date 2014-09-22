class Ckeditor::AttachmentFile < Ckeditor::Asset
  # self.abstract_class = true
  # self.table_name_prefix = 'j_'
  mount_uploader :data, CkeditorAttachmentFileUploader, :mount_on => :data_file_name

  def url_thumb
    @url_thumb ||= Ckeditor::Utils.filethumb(filename)
  end
end
