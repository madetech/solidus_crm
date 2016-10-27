describe Spree::Shipment do
  let!(:order) { create(:order_ready_to_ship) }
  let(:event_emitter) { instance_double('Crm::Event::Order') }

  before do
    expect(event_emitter).to receive(:emit).and_return(true)
    allow(Crm::Event::Order).to receive(:new) {
      event_emitter
    }
  end

  let(:shipment) { order.shipments.first }

  context 'when the shipment is shipped' do
    it 'should update the CRM platfrom' do
      shipment.ship!
    end
  end
end
