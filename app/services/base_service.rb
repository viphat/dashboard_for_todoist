class BaseService
  prepend SimpleCommand
  attr_reader :user, :access_token

  def self.call(*args, &block)
    new(*args, &block).call
  end

  def initialize(user: nil, access_token: nil)
    @user = user
    @access_token = user&.todoist_access_token || access_token
  end

  def call
    check_access_token!
  end

  private

  def check_access_token!
    raise Exceptions::AccessTokenRequired if access_token.blank?
  end
end
