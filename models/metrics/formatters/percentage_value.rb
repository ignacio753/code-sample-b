module Metrics
  module Formatters
    class PercentageValue < DecimalValue
      def json_format_value(value)
        percentage_value(value)
      end

      def csv_format_value(value)
        value = @is_raw_value ? percentage_value(value) : value
        round_value(value)
      end

      def percentage_value(value)
        value.to_f * 100
      end

      def round_value(value)
        "#{value.to_f.round(@number_decimals)}%".gsub(/.0%/, '%')
      end
    end
  end
end