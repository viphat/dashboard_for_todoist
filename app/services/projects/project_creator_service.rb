module Projects
  class ProjectCreatorService < BaseService
    attr_reader :todoist_project_id

    def initialize(user:, todoist_project_id:)
      super(user: user)
      @todoist_project_id = todoist_project_id
    end

    def call
      super
      todoist_project = Todoist::FindProjectApi.new(access_token: access_token, todoist_project_id: todoist_project_id).call

      project = user.projects.new(
        todoist_id: todoist_project.id,
        name: todoist_project.name,
        color: todoist_project.color,
        is_deleted: todoist_project.is_deleted,
        todoist_parent_id: todoist_project.parent_id
      )

      return project if project.save

      errors.add(:create_project, project.errors.full_messages)
    rescue Todoist::Exceptions::ObjectNotFound
      errors.add(:create_project, 'Project not found on Todoist.')
    end
  end
end
