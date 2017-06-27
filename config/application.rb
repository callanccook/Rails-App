require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Nameofapp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.cache_store = :redis_store, 'redis://localhost:6379/0/cache'
  end
end

# Generators for factories will automatically substitute fixture (and maybe any other fixture_replacement you set). 
# If you want to disable this feature, add the following to your application.rb file:
# config.generators do |g|
  # g.factory_girl false
# end

# Default factories directory is test/factories, or spec/factories if test_framework generator is set to :rspec; change this behavior with:
# config.generators do |g|
  # g.factory_girl dir: 'custom/dir/for/factories'
# end