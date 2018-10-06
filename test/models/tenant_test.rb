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

require 'test_helper'

class TenantTest < ActiveSupport::TestCase
  test_respond_to Tenant.new, [:name, :description, :subdomain]

  test 'valid tenant' do
    tenant = Tenant.new(name: 'valid', description: 'valid', subdomain: 'valid')
    assert tenant.valid?
  end

  test 'name is required' do
    tenant = Tenant.new(description: 'test', subdomain: 'test')
    assert_not tenant.valid?
  end

  test 'description is required' do
    tenant = Tenant.new(name: 'test', subdomain: 'test')
    assert_not tenant.valid?
  end

  test 'subdomain is required' do
    tenant = Tenant.new(name: 'test', description: 'test')
    assert_not tenant.valid?
  end

  test 'subdomain has to be unique' do
    Tenant.create(name: 'test1', description: 'test1', subdomain: 'not-uniq')
    tenant = Tenant.new(name: 'test2', description: 'test2', subdomain: 'not-uniq')
    assert_not tenant.valid?
  end
end
