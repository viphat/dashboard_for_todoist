class Todoist::ProjectsApi < Todoist::BaseRestApi
  private
  def resource_url
    'projects'
  end
end
