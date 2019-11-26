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
    config.secret_key_base = '0bea1cca69e6777125da86ee2a9f85f50f52d2bc41f086b064005fcf76f83905076ddb768102d048fe4fea4401e097ddf3497a5dca4677c10f9546fa56d96b48'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
