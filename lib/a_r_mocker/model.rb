module Assays
  module Mock
    class Model < OpenStruct
      def initialize(hash = {})
        @persisted = hash.delete(:persisted)
        hash = default_attributes.merge(hash)
        super
      end

      private def default_attributes
        {
          new_record?: !@persisted,
          persisted?: @persisted,
          id: @persisted ? 1 : nil,
          created_at: @persisted ? Time.now : nil,
          blank?: false
        }
      end

      # for generating path from object (e.g. edit_model_path(model))
      # For context, see ActionDispatch::Routing::RouteSet::Generator::PARAMETERIZE
      alias_attribute :to_param, :id
    end
  end
end
