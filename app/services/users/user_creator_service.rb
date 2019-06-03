module Users
  class UserCreatorService < BaseService
    attr_reader :access_token

    def initialize(access_token: nil)
      @access_token = access_token
    end

    def call
      todoist_user_info = Todoist::UserInfoApi.new(access_token: access_token)
      todoist_user_info_response = todoist_user_info.call

      user = User.new
      user.todoist_access_token = todoist_user_info.token
      user.todoist_id = todoist_user_info_response['id']
      user.email = todoist_user_info_response['email']
      user.full_name = todoist_user_info_response['full_name']
      user.avatar = todoist_user_info_response['avatar_big']

      user.save
    end
  end
end
