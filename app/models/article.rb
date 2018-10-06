# == Schema Information
#
# Table name: contents
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  type       :string
#  fields     :jsonb            not null
#  options    :jsonb            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < Content
  store_accessor :fields,
                 :description, :text
end
