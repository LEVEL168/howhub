require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Howhub
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = "Tokyo"
    config.active_record.default_timezone = :local
    config.i18n.default_locale = :ja
    # config.eager_load_paths << Rails.root.join("extras")
    config.hosts << 'xxx.onrender.com'
  end
end
