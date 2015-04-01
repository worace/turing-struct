class TuringStruct
  attr_reader :attributes

  def initialize(attributes)
    @attributes = attributes
  end

  def method_missing(method_name, *args, &block)
    if val = attributes[method_name]
      if val.is_a?(Hash)
        self.class.new(val)
      else
        val
      end
    else
      super(method_name, *args, &block)
    end
  end
end
