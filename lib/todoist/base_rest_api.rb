class Todoist::BaseRestApi
  attr_reader   :todoist_rest_api_base, :access_token
  attr_accessor :response

  def initialize(*)
    @todoist_rest_api_base = ENV['TODOIST_REST_API_BASE'].end_with?('/') ? ENV['TODOIST_REST_API_BASE'][0...-1] : ENV['TODOIST_REST_API_BASE']
    @access_token = access_token
  end

  def call(*)
    @response = http_get
  end

  private

  def http_method
    raise Exceptions::NotImplemented
  end

  def http_post(*); end

  def http_get(*)
    url = "#{todoist_rest_api_base}/#{resource_url}"
    HTTParty.get(url, headers: headers)
  end

  def resource_url
    raise Exceptions::NotImplemented
  end

  def token
    access_token || ENV['TODOIST_TEST_ACCESS_TOKEN']
  end

  def headers
    { 'Authorization' => "Bearer #{token}" }
  end
end
