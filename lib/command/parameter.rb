module TestLink
  module Command
    class Parameter
      attr_reader :name, :default

      def initialize(name, default = nil, mandatory = false)
        @name = name
        @default = default
        @mandatory = mandatory
      end

      def mandatory?
        @mandatory
      end
    end
  end
end