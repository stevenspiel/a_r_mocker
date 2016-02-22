module Assays
  module Mock
    class Models
      include Enumerable

      def initialize(count, persisted, attributes = {})
        @members = Array.new(count, Assays::Mock::Model.new(attributes.merge(persisted: persisted)))
      end

      def to_a
        @members
      end
    end
  end
end
