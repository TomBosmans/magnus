class Content < ApplicationRecord
  include Groupable

  TYPES = [
    Article,
    Page,
  ].freeze

  def self.types
    TYPES
  end
end
