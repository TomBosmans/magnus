module ApplicationHelper
  def namespace
    controller_path.split('/').first
  end

  def current_path?(path)
    url_for == url_for(path)
  end

  def color_for(type)
    { error: 'red', alert: 'orange', success: 'green' }.fetch(type.to_sym, nil)
  end
end
