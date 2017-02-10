module SolidusCrm
  module PreventOrderEmails
    extend ActiveSupport::Concern

    def deliver_order_confirmation_email
      return unless Spree::CrmConfig.deliver_mailers.permitted?(self)

      super
    end

    def send_cancel_email
      return unless Spree::CrmConfig.deliver_mailers.permitted?(self)

      super
    end
  end
end
