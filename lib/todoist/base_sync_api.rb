class Todoist::BaseSyncApi
  attr_reader   :todoist_sync_api_base, :access_token
  attr_accessor :response

  def initialize(*)
    @todoist_sync_api_base = ENV['TODOIST_SYNC_API_BASE']
    @access_token = access_token
  end

  def call(*)
    @response = HTTParty.post(
      todoist_sync_api_base,
      body: params
    )
  end

  private

  def params
    { token: token,
      sync_token: sync_token,
      resource_types: resource_types }
  end

  def token
    access_token || ENV['TODOIST_TEST_ACCESS_TOKEN']
  end

  def sync_token
    '*'
  end

  def resource_types
    raise Exceptions::NotImplemented
  end
end
