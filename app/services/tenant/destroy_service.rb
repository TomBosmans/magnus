class Tenant::DestroyService < ApplicationService
  def initialize(tenant)
    @tenant = tenant
  end

  def execute
    tenant.destroy
    Apartment::Tenant.drop(tenant.subdomain) if tenant.destroyed?
  end

  private

  attr_reader :tenant
end
