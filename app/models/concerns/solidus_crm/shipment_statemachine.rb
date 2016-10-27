module SolidusCrm
  module ShipmentStatemachine
    extend ActiveSupport::Concern

    included do
      state_machine do
        after_transition to: :shipped, do: :update_crm
      end
    end

    def update_crm
      Spree::CrmConfig.crm_shipment_emitter_class.new(self, self.state).emit
    end
  end
end
