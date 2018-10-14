class Tenant::CreateService < ApplicationService
  def initialize(params)
    @params = params.with_indifferent_access
  end

  def execute
    tenant = Tenant.new(params)
    ActiveRecord::Base.transaction do
      tenant.save
      create_apartment(tenant)
      Apartment::Tenant.switch(tenant.subdomain) do
        create_content_group
      end
    end

    tenant
  end

  private

  attr_reader :params

  def create_apartment(tenant)
    subdomain = tenant.subdomain
    Apartment::Tenant.create(subdomain)
  end

  def create_content_group
    Group.create(name: 'content')
  end
end
