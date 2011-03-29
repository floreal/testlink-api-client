module TestLink
  module Command
    class Argument
      attr_reader :default

      def initialize(default = nil, mandatory = false)
        @default = default
        @mandatory = mandatory
      end

      def mandatory?
        @mandatory
      end
    end
  end
end