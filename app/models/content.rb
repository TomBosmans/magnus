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
