class ArticleForm < ApplicationForm
  field :name
  field :description, type: :text
  field :text, type: :markdown
end
