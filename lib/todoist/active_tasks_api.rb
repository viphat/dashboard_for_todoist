class Todoist::ActiveTasksApi < Todoist::BaseRestApi
  attr_reader :project_id

  def initialize(access_token:, project_id:)
    super(access_token: access_token)
    @project_id = project_id
  end

  private

  def resource_url
    'tasks'
  end
end
