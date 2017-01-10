module SolidusCrm
  module ReimbursementEvent
    extend ActiveSupport::Concern

    def send_reimbursement_email
      Spree::CrmConfig.crm_reimbursement_emitter_class.new(order, order.state).emit

      return unless Spree::CrmConfig.deliver_mailers

      super
    end
  end
end
