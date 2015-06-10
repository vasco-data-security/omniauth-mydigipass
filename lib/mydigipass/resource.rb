module Mydigipass

  class Resource
    attr_accessor :access_token, :resource_url

    def initialize(access_token, resource_url)
      @access_token = access_token
      @resource_url = resource_url
    end

    # Returns a hash of parsed json data.
    # @return [Hash] parsed json data.
    def fetch_data
      data(resource_url).parsed
    end

    protected

    def data(url, headers={})
      access_token.get(url, headers: headers)
    end
  end
end
