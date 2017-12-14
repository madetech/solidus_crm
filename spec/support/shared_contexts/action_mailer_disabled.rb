shared_context 'when mailer deliveries are enabled' do
  let!(:deliver_mailers) { true }
  xit { is_expected.not_to be_empty }
end

shared_context 'when mailer deliveries are disabled' do
  let!(:deliver_mailers) { false }
  it { is_expected.to be_empty }
end

shared_context 'a mailer that can be disabled' do
  context { include_context 'when mailer deliveries are enabled' }
  context { include_context 'when mailer deliveries are disabled' }
end
