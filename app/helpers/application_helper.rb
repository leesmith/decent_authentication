module ApplicationHelper

  def alert_class_for(flash_type)
    { success: 'alert-success', error: 'alert-error', warning: 'alert-warning', info: 'alert-info' }[flash_type.to_sym] || flash_type.to_s
  end

  def model_error_display(model, attribute)
    if field_with_error?(model, attribute)
      content_tag(:small, model.errors[attribute].first.to_s, class: 'text-danger')
    end
  end

  def field_with_error?(model, attribute)
    model.errors[attribute].present?
  end

  def form_error_class(model, attribute)
    field_with_error?(model, attribute) ? 'input-invalid' : nil
  end

end
