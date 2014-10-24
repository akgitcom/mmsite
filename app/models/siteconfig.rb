class Siteconfig < ActiveRecord::Base
  mount_uploader :img ,SiteconfigUploader
end
