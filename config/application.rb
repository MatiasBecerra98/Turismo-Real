require_relative 'boot'

require 'rails/all'
require "active_storage/engine"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module A
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.before_configuration do
      I18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
      I18n.default_locale = :es
      I18n.reload!
    end

    config.autoload_paths << Rails.root.join("lib")
    config.eager_load_paths << Rails.root.join("lib")
    config.secret_key_base = '18c77a1ddef05bc31e3f8d32cc32d031bb21326522782d92af3242d48d4caa5c7535f9b591ee693ac86bebb7008424572a176bea861ef94e31d9dbab56135b27'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
