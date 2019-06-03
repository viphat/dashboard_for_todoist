class Todoist::GetProjectsApi < Todoist::BaseApi
  private

  def pagination?
    true
  end

  def resource_types
    '["projects"]'
  end
end
