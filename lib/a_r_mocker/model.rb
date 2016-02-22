module ARMocker
  # Object that acts as an ActiveRecord model so form objects can use
  # them as dummy data
  class Model < OpenStruct
    def initialize(hash = {})
      @persisted = hash.slice(:_persisted)
      hash = default_attributes.merge(hash)
      super
    end

    def self.create(hash = {})
      new(hash.merge(_persisted: true))
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
    def to_param
      id
    end
  end
end
