class ApplicationController < ActionController::Base
  prepend_view_path Rails.root.join('frontend')

  helper_method :content, :current_tenant

  def content
    @content ||= Group.find_by(name: 'content').items
  end

  def current_tenant
    @current_tenant ||= Tenant.find_by(subdomain: Apartment::Tenant.current)
  end
end
