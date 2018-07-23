module ServerNames
  def self.for(tenants:, domain:)
    list = [domain, "www.#{domain}"]
    tenants.inject(list) do |list, tenant|
      list.push "#{tenant.subdomain}.#{domain}"
    end
  end
end
