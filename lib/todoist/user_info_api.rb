class Todoist::UserInfoApi < Todoist::BaseSyncApi
  def call
    super
    Todoist::Models::User.new(response['user'])
  end

  def token
    super
  end

  private

  def resource_types
    '["user"]'
  end
end
