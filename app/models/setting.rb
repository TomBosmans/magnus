class Setting < ApplicationRecord
  validate :only_one_column_allowed, on: :create

  store_accessor :application,
                 :name, :description,
                 :primary_color, :secondary_color

  private

  def only_one_column_allowed
    errors.add(:application, :already_exists) if Setting.any?
  end
end
