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

class Content < ApplicationRecord
  include Groupable

  # Add all content types in this Array.
  TYPES = [
    Article
  ].freeze

  def self.types
    TYPES
  end
end
