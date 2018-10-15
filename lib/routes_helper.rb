module RoutesHelper
  def resources_content(params = {})
    Content.types.each do |klass|
      params[:controller] = 'contents'
      params[:type] = klass.to_s
      resources klass.to_s.underscore.gsub('/', '_').pluralize, params
    end
  end

  def return_non_existing_paths(to:)
    match '*path', to: to, via: :all
  end
end
