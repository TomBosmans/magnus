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
  validates :name,
            presence: true

  validates :description,
            presence: true

  validates :subdomain,
            presence: true,
            uniqueness: true
end
