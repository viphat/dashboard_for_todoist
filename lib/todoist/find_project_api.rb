class Todoist::FindProjectApi < Todoist::Base
  attr_reader :todoist_project_id

  def initialize(access_token:, todoist_project_id:)
    super(access_token: access_token)
    @todoist_project_id = todoist_project_id
  end

  def call
    projects = Todoist::ProjectsApi.new(access_token: access_token).call

    projects.each do |project|
      return project if project.id == todoist_project_id.to_i
    end

    raise Todoist::Exceptions::ObjectNotFound
  end
end
