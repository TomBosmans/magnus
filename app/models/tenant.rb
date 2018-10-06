# == Schema Information
#
# Table name: public.tenants
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :string
#  subdomain   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Tenant < ApplicationRecord
  after_create :create_apartment_tenant
  before_destroy :drop_apartment_tenant

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

  def drop_apartment_tenant
    Apartment::Tenant.drop(subdomain)
  end
end
