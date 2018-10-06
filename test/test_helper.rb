ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
end

class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    setup_tenant(subdomain: 'test-tenant')
  end
end

def setup_tenant(subdomain:)
  Tenant.find_by(subdomain: subdomain)&.destroy
  Tenant.create(name: 'test', description: 'test', subdomain: subdomain)
  Apartment::Tenant.switch!(subdomain)
  host! "#{subdomain}.example.com:80"
end

def test_respond_to(object, methods)
  methods.each do |method|
    test "responds to #{method}" do
      assert object.respond_to? method
    end
  end
end
