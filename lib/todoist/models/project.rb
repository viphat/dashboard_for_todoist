module Todoist
  module Models
    class Project < Todoist::Models::Base
      attr_accessor :id, :name, :color, :is_deleted, :parent_id, :child_order, :inbox_project, :is_favorite
    end
  end
end
