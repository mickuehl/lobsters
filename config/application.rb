require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_view/railtie"
# require "action_cable/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Lobsters
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.autoload_paths += %W( lib/ )
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # migrated from old application.rb
    # FIXME move this elsewhere !
    def allow_invitation_requests?
      true
    end

    def domain
      "example.com"
    end

    def open_signups?
      ENV["OPEN_SIGNUPS"] == "true"
    end

    def name
      "Lobsters"
    end

    def read_only?
      false
    end

    def root_url
      Rails.application.routes.url_helpers.root_url(
        :host => Rails.application.domain,
        :protocol => Rails.application.ssl? ? "https" : "http",
      )
    end

    def ssl?
      true
    end

    def shortname
      name.downcase.gsub(/[^a-z]/, "")
    end
    
  end
end

# Monkey patch stuff
# DANGER
require "monkey"