class ComponentGenerator < Rails::Generators::Base
  argument :name, required: true, desc: 'Component name, e.g: button'

  def create_view_file
    create_file "#{component_path}/_#{component_name}.html.erb"
  end

  def create_css_file
    create_file "#{component_path}/#{component_name}.css"
  end

  def create_js_file
    create_file "#{component_path}/#{component_name}.js" do
      # require component's CSS inside JS automatically
      "import \"./#{component_name}.css\";\n"
    end
  end

  protected

  def component_path
    if namespace?
      "frontend/components/#{namespace}/#{component_name}"
    else
      "frontend/components/#{component_name}"
    end
  end

  def split_name
    name.split(/[:,::,\/]/).reject(&:blank?).map(&:underscore)
  end

  def component_name
    split_name.last.underscore
  end

  def namespace
    split_name[0...-1].join("_")
  end

  def namespace?
    split_name.size > 1
  end
end
