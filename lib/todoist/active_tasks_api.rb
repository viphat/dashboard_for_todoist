class Todoist::ActiveTasksApi < Todoist::BaseRestApi
  attr_reader :project_id

  def initialize(project_id:)
    super
    @project_id = project_id
  end

  private

  def resource_url
    'tasks'
  end
end
