describe SolidusCrm::Connection do
  subject { described_class }

  context 'when the CRM is posted data' do
    subject do
      described_class.post(
        '/order',
        { ok: 'go' }.to_json
      )
    end

    around do |example|
      VCR.use_cassette cassette_name do
        example.run
      end
    end

    context 'and the response is bad' do
      let(:cassette_name) { :bad_http_response }
      let(:expected_log) do
        "Bad response from CRM, got 403 not 200"
      end

      before do
        expect(Rails.logger).to receive(:info).with(expected_log)
      end

      it 'should log an error response' do
        subject
      end
    end
  end
end
