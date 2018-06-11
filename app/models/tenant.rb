class Tenant < ApplicationRecord
  after_create :create_apartment_tenant

  validates :name,
            presence: true

  validates :description,
            presence: true

  validates :subdomain,
            presence: true,
            uniqueness: true

  private

  def create_apartment_tenant
    Apartment::Tenant.create(subdomain)
  end
end
