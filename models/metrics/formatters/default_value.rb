module Metrics
  module Formatters
    class DefaultValue
      ZERO_INT = 0
      ZERO_FLOAT = 0.00
      NA = 'N/A'
      attr_accessor :na_as_default

      def initialize(number_decimals)
        @number_decimals = number_decimals
        @na_as_default = true
      end

      def not_available
        NA
      end

      def default
        @na_as_default ? not_available : default_value
      end

      def is_valid?(value)
        value.present? && value != not_available
      end

      def json_format(value)
        is_valid?(value) ? json_format_value(value) : default
      end

      def csv_format(value, is_raw_value)
        @is_raw_value = is_raw_value
        is_valid?(value) ? csv_format_value(value) : default
      end

      protected

      # Override in each formatter
      def csv_format_value(value)
        value
      end

      def json_format_value(value)
        value
      end

      def default_value
        ZERO_INT
      end
    end
  end
end