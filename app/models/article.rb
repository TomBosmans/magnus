class Article < Content
  store_accessor :fields,
                 :description, :text
end
