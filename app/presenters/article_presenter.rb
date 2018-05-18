class ArticlePresenter
  include ActiveModel::Model

  attr_accessor :article

  delegate :name, :description, :text, to: :article

  def initialize(article)
    self.article = article
  end

  def fields
    {
      article.class.human_attribute_name(:description) => description
    }
  end

  def action_buttons
    {
      destroy: {
        path: [:admin, article],
        icon: 'delete',
        method: 'DELETE',
        css_class: 'red'
      },
      edit: {
        path: [:edit, :admin, article],
        icon: 'edit',
        css_class: 'orange'
      }
    }
  end
end
