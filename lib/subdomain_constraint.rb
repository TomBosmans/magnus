class SubdomainConstraint
  BLACKLIST = [
    'www',
    'admin',
    'public',
    'api'
  ].freeze

  # This gets called automagically by rails
  def self.matches?(request)
    request.subdomain.present? && !BLACKLIST.include?(request.subdomain)
  end
end
