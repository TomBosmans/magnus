class PagePresenter
  include ActiveModel::Model

  attr_accessor :page

  delegate :name, :text, to: :page

  def initialize(page)
    self.page = page
  end

  def fields
    {}
  end

  def action_buttons
    {
      edit: {
        path: [:edit, :admin, page],
        icon: 'edit',
        css_class: 'orange'
      }
    }
  end
end
