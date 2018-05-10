module ApplicationHelper
  def namespace
    controller_path.split('/').first
  end

  def component(component_name, locals = {}, &block)
    render "components/#{namespace}/#{component_name}/#{component_name}", locals, &block
  end

  ICONS_FOR_CLASS = {
    Group => 'folder'
  }.freeze

  def icon_for(klass)
    ICONS_FOR_CLASS.fetch(klass, 'insert_drive_file')
  end
end
