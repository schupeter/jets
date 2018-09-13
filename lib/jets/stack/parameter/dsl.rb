class Jets::Stack
  class Parameter
    module Dsl
      extend ActiveSupport::Concern

      def parameters
        Parameter.definitions(self.class)
      end

      included do
        class << self
          def parameter(*definition)
            # self is subclass is the stack that inherits from Jets::Stack
            # IE: ExampleStack < Jets::Stack
            Parameter.new(self, *definition).register
          end
        end
      end
    end
  end
end