module Assays
  module Mock
    class HasMany
      include Enumerable

      def initialize(members)
        @members = members
      end

      def each(&block)
        @members.each(&block)
        self
      end

      def build(attributes = {})
        new_member = new_member(attributes.merge(persisted: false))
        @members << new_member
        new_member
      end

      def create(attributes = {})
        created_member = new_member(attributes.merge(persisted: true))
        @members << created_member
        created_member
      end

      def delete(member)
        @members.delete(member)
        true
      end

      def to_ary
        @members
      end

      private def new_member(attributes = {})
        Assays::Mock::Model.new(attributes.merge(persisted: attributes.delete(:persisted)))
      end
    end
  end
end
