module Projects
  class TodoistProjectsListingService < BaseService
    def call
      super
      Todoist::ProjectsApi.new(access_token: access_token).call
    end
  end
end
