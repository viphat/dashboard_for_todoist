class Todoist::UserInfo < Todoist::BaseApi
  attr_reader :access_token

  def initialize(access_token: nil)
    @access_token = access_token
    super(user: nil)
  end

  def call
    super
    response['user']
  end

  def token
    access_token || ENV['TODOIST_TEST_ACCESS_TOKEN']
  end

  private

  def resource_types
    '["user"]'
  end
end
