class Content < ApplicationRecord
  include Groupable

  # Add all content types in this Array.
  TYPES = [
  ].freeze

  def self.types
    TYPES
  end
end
