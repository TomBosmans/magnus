class UserForm < ApplicationForm
  field :email, type: :email
  field :password, type: :password
  field :password_confirmation, type: :password
end
