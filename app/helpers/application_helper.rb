module ApplicationHelper
  def namespace
    controller_path.split('/').first
  end

  def current_path?(path)
    url_for == url_for(path)
  end
end
