require 'resource'

class EidResource < Resource

  def fetch_data(etag_header)
    access_token.get(resource_url, headers: {'ETag' => etag_header}).parsed
  end

end