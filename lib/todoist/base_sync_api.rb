class Todoist::BaseSyncApi < Todoist::Base
  attr_reader   :todoist_sync_api_base
  attr_accessor :response

  def initialize(access_token:)
    super(access_token: access_token)
    @todoist_sync_api_base = ENV['TODOIST_SYNC_API_BASE']
  end

  def call(*)
    @response = HTTParty.post(
      todoist_sync_api_base,
      body: params
    )
  end

  private

  def params
    { token: access_token,
      sync_token: sync_token,
      resource_types: resource_types }
  end

  def sync_token
    '*'
  end

  def resource_types
    raise Todoist::Exceptions::MethodNotImplemented
  end
end
