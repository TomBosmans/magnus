class PasswordForm < ApplicationForm
  resource :user do
    field :password, type: :password
    field :password_confirmation, type: :password
  end
end
