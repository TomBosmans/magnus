class ArticleForm < ApplicationForm
  field :name
  field :description, type: :text
  field :thumbnail, type: :image
end
