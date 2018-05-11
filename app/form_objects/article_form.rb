class ArticleForm < ApplicationForm
  field :name
  field :description, type: :text, data: { length: 25 }
  field :thumbnail, type: :file

  def build_for(group)
    article = Article.new(article_attributes)
    article.group = group
    article
  end
end
