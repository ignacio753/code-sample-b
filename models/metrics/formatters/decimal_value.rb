module Metrics
  module Formatters
    class DecimalValue < DefaultValue
      def default_value
        ZERO_FLOAT
      end

      def json_format_value(value)
        value.to_f
      end

      def csv_format_value(value)
        value.to_f.round(@number_decimals)
      end
    end
  end
end