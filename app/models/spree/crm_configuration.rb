module Spree
  class CrmConfiguration < Preferences::Configuration
    preference :crm_endpoint, :string, default: ''

    attr_writer :crm_order_emitter_class
    def crm_order_emitter_class
      @crm_order_emitter_class ||= SolidusCrm::Event::Order
    end

    attr_writer :crm_shipment_emitter_class
    def crm_shipment_emitter_class
      @crm_shipment_emitter_class ||= SolidusCrm::Event::Order
    end

    attr_writer :crm_request_headers
    def crm_request_headers
      @crm_request_headers ||= {}
    end
  end
end
