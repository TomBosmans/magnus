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

describe Tenant do
  instance_responds_to :name, :description, :subdomain

  it 'is valid' do
    tenant = Tenant.new(name: 'valid', description: 'valid', subdomain: 'valid')
    assert tenant.valid?
  end

  describe '#name' do
    it 'is required' do
      tenant = Tenant.new(description: 'test', subdomain: 'test')
      assert_not tenant.valid?
    end
  end

  describe '#description' do
    it 'is required' do
      tenant = Tenant.new(name: 'test', subdomain: 'test')
      assert_not tenant.valid?
    end
  end

  describe '#subdomain' do
    it 'is required' do
      tenant = Tenant.new(name: 'test', description: 'test')
      assert_not tenant.valid?
    end

    it 'has to be unique' do
      Tenant.create(name: 'test1', description: 'test1', subdomain: 'not-uniq')
      tenant = Tenant.new(name: 'test2', description: 'test2', subdomain: 'not-uniq')
      assert_not tenant.valid?
    end
  end
end
