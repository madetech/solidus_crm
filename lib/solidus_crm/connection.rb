require 'httparty'

module SolidusCrm
  module Connection
    class Post
      include HTTParty

      base_uri Spree::CrmConfig.crm_endpoint


      def self.perform(endpoint, body, headers)
        post(endpoint, body: body, headers: headers)
      end
    end

    CONNECTION_ERRORS = [HTTParty::Error, Errno::ECONNREFUSED]

    module_function

    def post(endpoint, body, headers = {})
      process_response(
        SolidusCrm::Connection::Post.perform(endpoint, body, headers)
      )
    rescue *CONNECTION_ERRORS => error
      Rails.logger.info(error)
    end

    private

    module_function

    def process_response(response)
      if response.code != 200
        Rails.logger.info("Bad response from CRM, got #{response.code} not 200")
      end
    end
  end
end
