class User < ApplicationRecord
  has_many :projects
  validates :email, presence: true
  validates :todoist_user_id, presence: true
  validates :full_name, presence: true
  validates :todoist_access_token, presence: true

  def self.create_user_with_data_from_todoist(access_token: nil)
    todoist_user_info = Todoist::UserInfo.new(access_token: access_token)
    todoist_user_info_response = todoist_user_info.call

    user = User.new
    user.todoist_access_token = todoist_user_info.token
    user.todoist_user_id = todoist_user_info_response['id']
    user.email = todoist_user_info_response['email']
    user.full_name = todoist_user_info_response['full_name']
    user.avatar = todoist_user_info_response['avatar_big']

    user.save!
  end
end
