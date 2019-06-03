module Projects
  class GetTodoistProjectsService < BaseService
    attr_reader :user

    def initialize(user:)
      @user = user
    end

    def call
      access_token = user&.todoist_access_token
      raise Exceptions::AccessTokenRequired if access_token.blank?
    end
  end
end
