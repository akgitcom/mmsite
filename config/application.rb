require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Mmsite
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.enforce_available_locales = true
    # # or if one of your gem compete for pre-loading, use
    config.time_zone = 'Beijing'
    config.active_record.default_timezone = :local

    I18n.config.enforce_available_locales = false
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :'zh-CN'

    # config.i18n.default_locale = :zh
    config.active_record.table_name_prefix = 'j_'

    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)
    config.assets.precompile += Ckeditor.assets
    config.assets.precompile += %w(ckeditor/*)

    config.assets.paths << "#{Rails}/vendor/assets/fonts"

    # 指定devise的layout
    config.to_prepare do
      Devise::SessionsController.layout "admin"
      Devise::RegistrationsController.layout "admin"
      Devise::ConfirmationsController.layout "admin"
      Devise::UnlocksController.layout "admin"
      Devise::PasswordsController.layout "admin"
    end

  end
end
