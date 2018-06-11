class Tenant < ApplicationRecord
  validates :name,
            presence: true

  validates :description,
            presence: true

  validates :subdomain,
            presence: true,
            uniqueness: true
end
