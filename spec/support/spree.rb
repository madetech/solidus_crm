require 'spree/testing_support/authorization_helpers'
require 'spree/testing_support/caching'
require 'spree/testing_support/capybara_ext'
require 'spree/testing_support/controller_requests'
require 'spree/testing_support/factories'
require 'spree/testing_support/flash'
require 'spree/testing_support/preferences'
require 'spree/testing_support/url_helpers'
require 'spree/api/testing_support/helpers'
require 'spree/api/testing_support/setup'

require 'solidus_crm/factories'

RSpec.configure do |config|
  config.include Spree::Api::TestingSupport::Helpers, type: :controller
  config.include Spree::Api::TestingSupport::Setup, type: :controller
  config.include ActiveJob::TestHelper
  config.include Spree::TestingSupport::Preferences
  config.include Spree::TestingSupport::UrlHelpers
  config.include Spree::TestingSupport::ControllerRequests, type: :controller
  config.include Spree::TestingSupport::Flash
end
