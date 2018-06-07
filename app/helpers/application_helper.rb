module ApplicationHelper
  def namespace
    controller_path.split('/').first
  end

  def current_path?(path)
    url_for == url_for(path)
  end

  def color_for(type)
    case type.to_sym
    when :error
      'red'
    when :alert
      'orange'
    when :success
      'green'
    else
      nil
    end
  end
end
