class Xavius::FormBuilder < ActionView::Helpers::FormBuilder
  def text_field(attribute, options = {})
    @template.content_tag(:div, class: "field") do
      label(attribute, class: "label") +
      @template.content_tag(:div, class: "control") do
        super(attribute, options.merge(class: "input"))
      end
    end
  end

  def text_area(attribute, options = {})
    @template.content_tag(:div, class: "field") do
      label(attribute, class: "label") +
      @template.content_tag(:div, class: "control") do
        super(attribute, options.merge(class: "textarea"))
      end
    end
  end

  def select(attribute, choices = nil, options = {}, html_options = {}, &block)
    @template.content_tag(:div, class: "field") do
      label(attribute, class: "label") +
      @template.content_tag(:div, class: "control") do
        @template.content_tag(:div, class: "select") do
          super(attribute, choices, options, html_options, &block)
        end
      end
    end
  end

  def submit(value = nil, options = {})
    @template.content_tag(:div, class: "control") do
      super(value, options.merge(class: "button is-primary"))
    end
  end

  def input(attribute, options = {}, as: :text_field)
    send(as, attribute, options.merge(class: "input"))
  end
end