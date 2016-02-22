module ARMocker
  module Relation
    # A wrapper for models intended to act as an ActiveRecord::Relation
    # for a has_many relationship
    class HasMany
      include Enumerable

      def initialize(members)
        @members = members.is_a?(ARMocker::Models) ? members.to_a : members
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
        Model.new(attributes.merge(persisted: attributes.delete(:persisted)))
      end
    end
  end
end
