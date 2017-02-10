module SolidusCrm
  module PreventOrderCartonEmail
    extend ActiveSupport::Concern

    private

    def send_shipment_emails(carton)
      return unless Spree::CrmConfig.deliver_mailers[carton.orders.first]

      super(carton)
    end
  end
end
