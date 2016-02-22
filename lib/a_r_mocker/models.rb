module ARMocker
  # Generates multiple Models. Attributes passed are applied to every model
  # generated.
  class Models
    include Enumerable

    # @param count [Integer] the number of models to be generated
    # @param persisted [Boolean] whether the models will act as though they
    # have persisted
    # @param attributes [Hash] attributes to be applied to every model
    def initialize(count, attributes = {})
      @members = Array.new(count, ARMocker::Model.new(attributes.merge(persisted: attributes.delete(:_persisted))))
    end

    def self.create(count, attributes = {})
      new(count, attributes.merge(_persisted: true))
    end

    def to_a
      @members
    end
  end
end
