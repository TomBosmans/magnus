require 'erb'
require 'server_names'

class NginxConfGenerator < Rails::Generators::Base
  desc 'This will generate the nginx.conf file based on environment variables.'
  def generate_nginx_conf
    create_file(target, force: true)
    content = render_erb
    write_file(content)
  end

  private

  def target
    'config/nginx.conf'
  end

  def template
    File.read('config/nginx_template.conf.erb')
  end

  def render_erb
    ERB.new(template).result(binding)
  end

  def write_file(content)
    File.open(target, "w+") do |file|
      file.write(content)
    end
  end

  # These are used inside the nginx_template.conf.erb:
  def user
    ENV['SERVER_USER']
  end

  def app_name
    ENV['APPLICATION_NAME']
  end

  def domain
    ENV['SERVER_DOMAIN']
  end

  def server_names
    ServerNames.for(tenants: Tenant.all, domain: ENV['SERVER_DOMAIN'])
  end
end
