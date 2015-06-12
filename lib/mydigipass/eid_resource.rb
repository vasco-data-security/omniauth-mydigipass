require 'mydigipass/resource'

module Mydigipass
  class EidResource < Resource

    # Returns eid data of a user. Set the Etag header value for checking if the data has changed.
    # @param [String] etag
    # @return [Hash] eid data attributes
    def fetch_data(etag)
      headers = {}

      if etag
        headers = { headers: etag_header(etag) }
      end

      data(resource_url, headers).parsed
    end

    protected

    def etag_header(etag)
      headers = {}
      headers['Etag'] = etag unless etag.nil?
      headers
    end
  end
end
