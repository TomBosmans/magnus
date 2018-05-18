class PageForm < ApplicationForm
  field :name
  field :text, type: :text

  def build_for(group)
    page = Page.new(page_attributes)
    page.group = group
    page
  end
end
