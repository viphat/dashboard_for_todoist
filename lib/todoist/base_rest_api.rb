class Todoist::BaseRestApi < Todoist::Base
  attr_reader   :todoist_rest_api_base
  attr_accessor :response

  def initialize(access_token:)
    super(access_token: access_token)
    @todoist_rest_api_base = ENV['TODOIST_REST_API_BASE'].end_with?('/') ? ENV['TODOIST_REST_API_BASE'][0...-1] : ENV['TODOIST_REST_API_BASE']
  end

  def call(*)
    @response = http_get
  end

  private

  def http_method
    raise Todoist::Exceptions::MethodNotImplemented
  end

  def http_post(*); end

  def http_get(*)
    url = "#{todoist_rest_api_base}/#{resource_url}"
    HTTParty.get(url, headers: headers)
  end

  def resource_url
    raise Todoist::Exceptions::MethodNotImplemented
  end

  def headers
    { 'Authorization' => "Bearer #{access_token}" }
  end
end
