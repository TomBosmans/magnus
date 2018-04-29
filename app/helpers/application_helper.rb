module ApplicationHelper
  def component(component_name, locals = {}, &block)
    name = component_name.to_s.split('_').first
    render "components/#{name}/#{component_name}", locals, &block
  end
end
