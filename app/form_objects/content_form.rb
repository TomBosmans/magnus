class ContentFrom < ApplicationFrom
  field :name

  def build_for(group)
    content = Content.new(content_attributes)
    content.group = group
    content
  end
end
