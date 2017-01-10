module SolidusCrm
  module PreventOrderCartonEmail
    extend ActiveSupport::Concern

    private

    def send_shipment_emails(carton)
      return unless Spree::CrmConfig.deliver_mailers

      super(carton)
    end
  end
end
