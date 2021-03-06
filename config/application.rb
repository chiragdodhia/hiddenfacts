require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AjackusAssignment
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    # config.i18n.load_path += Dir[Rails.root.join('locales', '*.{rb,yml}')]
    config.i18n.default_locale = :en
    config.assets.precompile << %w( *.scss *.css *.js *.jpg *.png )
    config.assets.paths << "#{Rails.root}/vendor/assets"

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
