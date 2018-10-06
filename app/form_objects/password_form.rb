class PasswordForm < ApplicationForm
  resource :user do
    field :password, type: :password
    field :password_confirmation, type: :password
  end

  validates :user_password, :user_password_confirmation,
            presence: true
end
