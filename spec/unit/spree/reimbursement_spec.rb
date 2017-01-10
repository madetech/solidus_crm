describe Spree::Reimbursement do
  let(:reimbursement) { create(:reimbursement) }

  before do
    stub_const('SolidusCrm::Connection', double.as_null_object)
  end

  subject { ActionMailer::Base.deliveries }

  context 'SolidusCrm::ReimbursementEvent#reimbursement_email' do
    context do
      before do
        Spree::CrmConfig.deliver_mailers = deliver_mailers
        reimbursement.send_reimbursement_email
      end

      it_behaves_like 'a mailer that can be disabled'
    end

    let(:event_emitter) { instance_double('SolidusCrm::Event::Order') }
    it 'emits a crm event' do
      expect(event_emitter).to receive(:emit).and_return(true)
      allow(SolidusCrm::Event::Order).to receive(:new) { event_emitter }
      reimbursement.send_reimbursement_email
    end
  end
end
