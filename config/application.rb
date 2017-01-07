require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rogacz
  class Application < Rails::Application
    Rails.application.configure do
      config.assets.enabled = true
      config.assets.paths << "#{Rails.root}/app/assets/fonts"

      config.generators do |g|
        g.test_framework :rspec, fixture: false
        g.integration_tool :rspec
        g.fixture_replacement :factory_girl, dir: 'spec/factories'
      end
      config.time_zone = 'Warsaw'
      config.autoload_paths += Dir["#{config.root}/app/**/"]
      config.autoload_paths += Dir["#{config.root}/lib/**/"]
      config.eager_load_paths += %W(#{config.root}/lib)
    end
  end
end
