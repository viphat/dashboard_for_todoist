class Todoist::UserInfoApi < Todoist::BaseApi
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
