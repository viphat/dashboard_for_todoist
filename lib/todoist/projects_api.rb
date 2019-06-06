class Todoist::ProjectsApi < Todoist::BaseSyncApi
  def initialize(access_token:)
    super(access_token: access_token)
  end

  def call
    super

    projects = []

    response['projects'].each do |project|
      projects << Todoist::Models::Project.new(project)
    end

    projects
  end

  private

  def resource_types
    '["projects"]'
  end
end
