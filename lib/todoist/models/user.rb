module Todoist
  module Models
    class User < Todoist::Models::Base
      attr_accessor :id, :email, :full_name, :avatar_big, :is_premium, :daily_goal, :weekly_goal, :days_off, :tz_info
    end
  end
end
