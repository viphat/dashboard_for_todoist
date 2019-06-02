class Todoist::BaseApi
  attr_reader :todoist_api_base
  attr_accessor :user, :response

  def initialize(user: nil)
    @todoist_api_base = ENV['TODOIST_SYNC_API_BASE']
    @user = user
  end

  def call
    @response = HTTParty.post(todoist_api_base, body: {
      token: token,
      sync_token: sync_token,
      resource_types: resource_types
    })
  end

  private

  def token
    user&.todoist_access_token || ENV['TODOIST_TEST_ACCESS_TOKEN']
  end

  def sync_token
    '*'
  end

  def resource_types
    fail Exceptions::NotImplemented
  end
end
