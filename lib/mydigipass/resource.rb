module Mydigipass

  class Resource
    attr_accessor :access_token, :resource_url

    def initialize(access_token, resource_url)
      @access_token = access_token
      @resource_url = resource_url
    end

    def fetch_data
      access_token.get(resource_url).parsed
    end
  end
end
