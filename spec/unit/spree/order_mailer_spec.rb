describe 'built in solidus mailers are prevented' do
  let!(:order) { create(:order_ready_to_ship) }

  before do
    stub_const('SolidusCrm::Connection', double.as_null_object)
    allow(Spree::CrmConfig.deliver_mailers).to receive(:permitted?).and_return(deliver_mailers)
  end

  subject { ActionMailer::Base.deliveries }

  context 'SolidusCrm::PreventOrderEmails#confirm_email' do
    before { order.finalize! }

    it_behaves_like 'a mailer that can be disabled'
  end

  context 'SolidusCrm::PreventOrderEmails#send_cancel_email' do
    before { order.cancel! }

    it_behaves_like 'a mailer that can be disabled'
  end

  context 'SolidusCrm::PreventOrderCartonEmail#carton_email' do
    before { order.shipments.first.ship! }

    it_behaves_like 'a mailer that can be disabled'
  end
end
