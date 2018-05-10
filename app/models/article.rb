class Article < ApplicationRecord
  include Groupable

  has_one_attached :thumbnail
end
