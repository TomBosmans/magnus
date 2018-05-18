class Article < Content
  has_one_attached :thumbnail

  store_accessor :fields,
                 :description, :text
end
