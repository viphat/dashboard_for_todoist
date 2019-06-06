module Users
  class UserCreatorService < BaseService
    def call
      super

      todoist_user_info = Todoist::UserInfoApi.new(access_token: access_token)

      response = todoist_user_info.call

      user = User.new(
        todoist_access_token: access_token || todoist_user_info.token,
        todoist_id: response['id'],
        email: response['email'],
        full_name: response['full_name'],
        avatar_url: response['avatar_big']
      )

      return user if user.save

      errors.add(:user_creator, user.errors.full_messages)
    end
  end
end
