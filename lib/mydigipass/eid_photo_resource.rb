require 'mydigipass/eid_resource'

module Mydigipass

  class EidPhotoResource < EidResource

    # Does a request to the eid photo endpoint and returns the bytes of a jpeg image. Set the Etag header
    # to see if the data is changed or not.
    # @param [String] etag
    # @return [byte[]] the image in bytes
    def fetch_data(etag)
      headers = etag_header(etag)
      data(resource_url, headers: headers).body
    end
  end
end