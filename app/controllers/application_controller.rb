class ApplicationController < ActionController::Base
  prepend_view_path Rails.root.join('frontend')

  helper_method :content, :setting, :application

  def content
    @content ||= find_content
  end

  def setting
    @setting ||= Setting.first
  end
  alias_method :application, :setting

  private

  def find_content
    group = Group.find_by(name: 'content')
    group.items
  end
end
