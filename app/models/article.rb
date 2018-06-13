class Article < Content
  store_accessor :fields,
                 :title, :body
end
