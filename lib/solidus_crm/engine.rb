module SolidusCrm
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'solidus_crm'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer 'solidus_crm.environment', before: 'spree.environment' do
      Spree::CrmConfig = Spree::CrmConfiguration.new
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      Dir.glob(File.join(File.dirname(__FILE__), '../crm/**/*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      Spree::Shipment.include(SolidusCrm::ShipmentStatemachine)
      Spree::Order.include(SolidusCrm::OrderStatemachine)
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end