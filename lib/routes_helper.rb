module RoutesHelper
  def resources_content(only: nil, except: nil)
    Content.types.each do |klass|
      params = { controller: 'contents', type: klass.to_s }
      params[:only] = only if only
      params[:except] = except if except
      resources klass.to_s.underscore.gsub('/', '_').pluralize, params
    end
  end

  def return_non_existing_paths(to:)
    match '*path', to: to, via: :all
  end
end
