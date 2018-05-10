class ApplicationController < ActionController::Base
  prepend_view_path Rails.root.join('frontend')

  def content
    group = Group.find_by(name: 'content')
    group.items
  end

  helper_method :content
end
