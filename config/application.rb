require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HuntBook
  class Application < Rails::Application
    Rails.application.configure do
      config.web_console.whitelisted_ips = '130.149.7.201'
    end
  end
end
