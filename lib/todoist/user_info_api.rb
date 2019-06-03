class Todoist::UserInfoApi < Todoist::BaseSyncApi
  def call
    super
    response['user']
  end

  def token
    super
  end

  private

  def resource_types
    '["user"]'
  end
end
