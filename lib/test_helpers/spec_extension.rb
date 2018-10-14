module TestHelpers::SpecExtension
  extend ActiveSupport::Concern
  include ActiveSupport::Testing::ConstantLookup

  included do
    class << self
      alias context describe

      def described_class
        determine_constant_from_test_name(name) do |constant|
          constant.is_a?(Class)
        end
      end
    end

    def described_class
      self.class.described_class
    end
  end
end

