ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/spec'

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  extend MiniTest::Spec::DSL

  register_spec_type(self) do |klass|
    !controller_test?(klass)
  end
end

class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  register_spec_type(self) do |klass|
    controller_test?(klass)
  end

  def setup
    setup_tenant(subdomain: 'test-tenant')
  end

  def user
    @user ||= create(:user)
  end
end

def controller_test?(klass)
  klass < ActionController::Base if klass.is_a? Class
end

def setup_tenant(subdomain:)
  Tenant.find_by(subdomain: subdomain)&.destroy
  Tenant.create(name: 'test', description: 'test', subdomain: subdomain)
  Apartment::Tenant.switch!(subdomain)
  Group.create(name: 'content')
  host! "#{subdomain}.example.com:80"
end

def instance_responds_to(*methods)
  responds_to(described_class.new, methods)
end

def class_responds_to(*methods)
  responds_to(described_class, methods)
end

def responds_to(object, methods)
  methods.each do |method|
    it "responds to #{method}" do
      assert object.respond_to? method
    end
  end
end

def described_class
  @desc
end

alias context describe
