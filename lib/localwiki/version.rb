module Localwiki

  VERSION = '0.1.0'

  class Version

  def fetch_version (resource_version,identifier,params={})
    uri = '/api/' + resource_version.to_s + '/' + identifier
    http_get(uri,params)
  end

  end

end
