ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/spec'
require_relative '../lib/test_helpers'

class ActiveSupport::TestCase
  extend MiniTest::Spec::DSL

  include FactoryBot::Syntax::Methods
  include TestHelpers::SpecExtension

  register_spec_type(self) do |klass|
    !controller_test?(klass)
  end

  def self.controller_test?(klass)
    klass < ActionController::Base if klass.is_a? Class
  end

  def self.instance_responds_to(*methods)
    responds_to(described_class.new, methods)
  end

  def self.class_responds_to(*methods)
    responds_to(described_class, methods)
  end

  def self.responds_to(object, methods)
    methods.each do |method|
      it "responds to #{method}" do
        assert object.respond_to? method
      end
    end
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

  def setup_tenant(subdomain:)
    Tenant.find_by(subdomain: subdomain)&.destroy
    Tenant.create(name: 'test', description: 'test', subdomain: subdomain)
    Apartment::Tenant.switch!(subdomain)
    Group.create(name: 'content')
    host! "#{subdomain}.example.com:80"
  end
end
