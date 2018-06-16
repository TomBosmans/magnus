class ArticlePresenter < ApplicationPresenter
  attr_accessor :article
  delegate :name, :fields, :text, to: :article

  def initialize(article)
    self.article = article
  end

  def hallo
    'world'
  end
end
