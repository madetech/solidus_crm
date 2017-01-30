require 'net/http'
require 'uri'

module SolidusCrm
  module Connection
    class Post
      def self.perform(endpoint, body, headers)
        uri = URI.parse("#{Spree::CrmConfig.crm_endpoint}#{endpoint}")

        request = Net::HTTP::Post.new(uri)

        if headers.keys.include?('Context-Type')
          request.content_type = headers.slice('Context-Type').values.first
        end

        headers.except('Context-Type').each do |header, value|
          request[header] = value
        end

        request.body = body

        req_options = { use_ssl: uri.scheme == 'https' }

        response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
          http.request(request)
        end

        response
      end
    end

    CONNECTION_ERRORS = [Net::HTTPError, Errno::ECONNREFUSED]

    module_function

    def post(endpoint, body, headers = {})
      post_headers = headers.merge(Spree::CrmConfig.crm_request_headers)

      Rails.logger.info('CRM Request Payload: ' + body)

      process_response(
        SolidusCrm::Connection::Post.perform(endpoint, body, post_headers)
      )
    rescue *CONNECTION_ERRORS => error
      Rails.logger.info(error)
    end

    private

    module_function

    def process_response(response)
      if [201, 200].include?(response.code.to_i)
        Rails.logger.info('CRM notification successful')
      else
        Rails.logger.info("Bad response from CRM, got #{response.code} not 200")
      end
    end
  end
end
