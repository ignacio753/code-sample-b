class DisplayMetric
  attr_reader :id, :name, :display_name, :display_format, :number_decimals,
   :sym_code, :code, :is_total, :category, :sort_order

  DASH = '-'
  TOTAL = 'Total'
  STANDARD_ID = 1

  def initialize(id, name, display_name, display_format, number_decimals,
                  is_total, category_name, category_id, sort_order)
    @id = id.to_i
    @name = name
    @display_name = display_name
    @display_format = display_format
    @number_decimals = number_decimals.to_i
    @is_total = is_total
    @category = MetricCategory.new(category_id.to_i, category_name)
    @sort_order = sort_order.to_i
  end

  def code
    is_standard ? name : "#{name}_#{id}"
  end

  def is_standard
    category.id == STANDARD_ID
  end

  def sym_code
    code.to_sym
  end

  def formatter
    @formatter ||= begin
      basic_formatter = Metrics::Formatters::DefaultValue.new(number_decimals)
      metric_formatter = Object::const_get("Metrics::Formatters::#{display_format}Value").new(number_decimals) rescue basic_formatter
    end
  end

  def default_value
    formatter.default
  end

  def not_available
    formatter.not_available
  end

  def json_format_value(value)
    formatter.json_format(value)
  end

  # Format metric values for csv responses
  def csv_format_value(value, is_raw_value=false)
    formatter.csv_format(value, is_raw_value)
  end

end