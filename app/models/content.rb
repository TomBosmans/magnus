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
  belongs_to :creator, class_name: 'User'

  POSSIBLE_TYPES = [
    Article
  ].freeze

  def self.types
    POSSIBLE_TYPES
  end

  validates :name, :creator, presence: true
end
