class SettingForm < ApplicationForm
  field :name
  field :description, type: :text
  field :primary_color
  field :secondary_color
end
