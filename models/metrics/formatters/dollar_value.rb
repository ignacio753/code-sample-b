module Metrics
  module Formatters
    class DollarValue < DefaultValue
      def default_value
        not_available
      end

      def json_format_value(value)
        value.to_f
      end

      def csv_format_value(value)
        # rubocop:disable FormatString
        decimals = "%.#{@number_decimals}f"
        "$#{sprintf(decimals, value.to_f.round(@number_decimals))}".gsub(/\.00/, '')
      end
    end
  end
end