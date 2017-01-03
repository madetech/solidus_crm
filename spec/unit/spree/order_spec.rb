describe Spree::Order do
  let!(:order) { create(:order_ready_to_ship) }
  let(:event_emitter) { instance_double('SolidusCrm::Event::Order') }

  before do
    expect(event_emitter).to receive(:emit).and_return(true)
    expect(SolidusCrm::Event::Order).to receive(:new).with(order, state) {
      event_emitter
    }
  end

  context 'when the order is complete' do
    let(:state) { 'complete' }

    it 'should update the CRM platform' do
      order.update_attributes(state: :confirm)
      order.complete!
    end
  end

  context 'when the order is canceled' do
    let(:state) { 'canceled' }

    it 'should update the CRM platform' do
      order.cancel!
    end
  end
end
