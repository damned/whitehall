class ContentItemEditor

  attr_reader :item, :form_html

  def initialize(editor_data)
    @item = ContentItem.new(editor_data[:item])
    @form_html = editor_data[:form_html]
  end

  def attributes
    { }
  end

end