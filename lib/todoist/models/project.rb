module Todoist
  module Models
    class Project < Todoist::Models::Base
      attr_accessor :id, :name, :color, :is_deleted, :parent_id

      def initialize(payload)
        super(payload)
        @is_deleted = is_deleted == 1
      end
    end
  end
end
