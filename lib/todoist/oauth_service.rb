# https://developer.todoist.com/sync/v8/#oauth
# TODO: Obtain an user authorized API token
# scope: data:read
class Todoist::OauthService
  attr_reader :client_id, :client_secret

  def initialize
    @client_id = ENV['TODOIST_APP_KEY']
    @client_secret = ENV['TODOIST_SECRET_KEY']
  end
end
