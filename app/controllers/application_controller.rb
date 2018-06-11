class ApplicationController < ActionController::Base
  prepend_view_path Rails.root.join('frontend')

  helper_method :content, :current_tenant

  def content
    @content ||= find_content
  end

  def current_tenant
    @current_tenant ||= Apartment::Tenant.current
  end

  private

  def find_content
    group = Group.find_by(name: 'content')
    group.items
  end
end
