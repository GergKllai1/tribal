require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
Bundler.require(*Rails.groups)

module Tribal
	class Application < Rails::Application
		config.active_job.queue_adapter = :delayed_job
		config.assets.initialize_on_precompile = false
		config.load_defaults 5.2
		config.time_zone = "Europe/Stockholm"
    config.generators do |generate|
      generate.helper false
      generate.assets false
      generate.view_specs false
      generate.helper_specs false
      generate.routing_specs false
      generate.controller_specs false
      generate.system_tests false
		end
		config.stripe.publishable_key = 'pk_test_QicERB8w3kyqaYW3hUUQylRH'
    config.stripe.secret_key = Rails.application.credentials.stripe[:secret_key]
  end
end
