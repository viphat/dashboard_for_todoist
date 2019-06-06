module Users
  class UserCreatorService < BaseService
    attr_reader :access_token

    def initialize(access_token: nil)
      @access_token = access_token
    end

    def call
      todoist_user_info = Todoist::UserInfoApi.new(access_token: access_token)

      response = todoist_user_info.call

      User.create(
        todoist_access_token: access_token || todoist_user_info.token,
        todoist_id: response['id'],
        email: response['email'],
        full_name: response['full_name'],
        avatar_url: response['avatar_big']
      )
    end
  end
end
