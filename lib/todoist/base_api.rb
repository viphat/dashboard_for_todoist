class Todoist::BaseApi
  DEFAULT_ITEMS_LIMIT = 10

  attr_reader   :todoist_api_base, :access_token
  attr_accessor :response, :offset

  def initialize(access_token: nil)
    @todoist_api_base = ENV['TODOIST_SYNC_API_BASE']
    @access_token = access_token
    @offset = 1 if pagination?
  end

  def call(page: 1)
    calculate_offset_by_page(page: page) if pagination?

    @response = HTTParty.post(
      todoist_api_base,
      body: body
    )
  end

  private

  def calculate_offset_by_page(page:)
    @offset = (page - 1) * limit + 1
  end

  def body
    params =
      { token: token,
        sync_token: sync_token,
        resource_types: resource_types }

    params = params.merge(limit: limit, offset: offset) if pagination?

    params
  end

  def pagination?
    false
  end

  def limit
    DEFAULT_ITEMS_LIMIT
  end

  def token
    access_token || ENV['TODOIST_TEST_ACCESS_TOKEN']
  end

  def sync_token
    '*'
  end

  def resource_types
    raise Exceptions::NotImplemented
  end
end
