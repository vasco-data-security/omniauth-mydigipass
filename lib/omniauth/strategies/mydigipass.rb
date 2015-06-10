require 'omniauth-oauth2'
require 'mydigipass/tools'
require 'mydigipass/resource'
require 'mydigipass/eid_resource'
require 'mydigipass/eid_photo_resource'

module OmniAuth
  module Strategies
    class Mydigipass < OmniAuth::Strategies::OAuth2
      def self.default_client_urls(options = { })
        base_uri = ::Mydigipass::Tools.extract_base_uri_from_options(options)
        {
          :site          => base_uri,
          :authorize_url => base_uri + '/oauth/authenticate',
          :token_url     => base_uri + '/oauth/token'
        }
      end

      option :name, 'mydigipass'
      option :client_options, default_client_urls

      # These are called after authentication has succeeded.
      uid { access_token['uuid'] }

      info do
        {
          :uuid => access_token['uuid'],
          :profile => ::Mydigipass::Resource.new(access_token, "/oauth/user_data"),
          :eid_data => ::Mydigipass::EidResource.new(access_token, "/oauth/eid_data"),
          :eid_photo => ::Mydigipass::EidPhotoResource.new(access_token, "/oauth/eid_photo_data")
        }
      end
    end
  end
end
