shared_context 'when mailer deliveries are enabled' do
  let!(:deliver_mailers) { true }
  it { is_expected.not_to be_empty }
end

shared_context 'when mailer deliveries are disabled' do
  let!(:deliver_mailers) { false }
  it { is_expected.to be_empty }
end

describe 'built in solidus mailers are prevented' do
  let!(:order) { create(:order_ready_to_ship) }

  before do
    stub_const('SolidusCrm::Connection', double.as_null_object)
    Spree::CrmConfig.deliver_mailers = deliver_mailers
  end

  subject { ActionMailer::Base.deliveries }

  context 'SolidusCrm::PreventOrderEmails#confirm_email' do
    before { order.finalize! }

    context { include_context 'when mailer deliveries are enabled' }
    context { include_context 'when mailer deliveries are disabled' }
  end

  context 'SolidusCrm::PreventOrderEmails#send_cancel_email' do
    before { order.cancel! }

    context { include_context 'when mailer deliveries are enabled' }
    context { include_context 'when mailer deliveries are disabled' }
  end

  context 'SolidusCrm::PreventOrderCartonEmail#carton_email' do
    before { order.shipments.first.ship! }

    context { include_context 'when mailer deliveries are enabled' }
    context { include_context 'when mailer deliveries are disabled' }
  end
end
