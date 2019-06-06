module Projects
  class ProjectCreatorService < BaseService
    attr_reader :todoist_project_id

    def initialize(todoist_project_id:, **args)
      super(**args)
      @todoist_project_id = todoist_project_id
    end

    def call
      super
    end
  end
end
