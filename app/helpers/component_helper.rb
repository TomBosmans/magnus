module ComponentHelper
  # We don't want to use the name devise in our frontend folder.
  def components_subfolder
    namespace == 'devise' ? 'authentication' : namespace
  end

  def component(component_name, locals = {}, &block)
    render "components/#{components_subfolder}/#{component_name}/#{component_name}",
           locals, &block
  end

  def flash_messages(locals = {}, &block)
    render 'components/admin/flash_messages/flash_messages', locals, &block
  end

  # This helper is here for when no options are passed to a component.
  # This prevents to need to initialize an empty option in every component :)
  # TODO: find this a better home
  def options
    {}
  end
end
