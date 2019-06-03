class Todoist::ProjectsApi < Todoist::BaseRestApi
  private

  def pagination?
    false
  end

  def resource_url
    'projects'
  end
end
