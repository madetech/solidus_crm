module SolidusCrm
  module OrderStatemachine
    extend ActiveSupport::Concern

    included do
      state_machine do
        after_transition to: %i[address delivery payment canceled complete], do: :update_crm
      end
    end

    def update_crm
      Spree::CrmConfig.crm_order_emitter_class.new(self, state).emit
    end
  end
end
