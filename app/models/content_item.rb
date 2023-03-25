class ContentItem

  attr_reader :type_name

  def initialize(item_data)
    @type_name = item_data[:type_name]
  end

  def attributes
    {}
  end
end