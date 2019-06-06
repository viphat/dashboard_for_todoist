module Todoist
  module Models
    class Base
      def initialize(payload)
        payload.keys.each do |key|
          attr_assignment = "#{key}="
          send(attr_assignment, payload[key]) if respond_to?(key)
        end
      end
    end
  end
end
