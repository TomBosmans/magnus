class Admin::PasswordsController < AdminController
  def edit
    password_form= PasswordForm.new(user: user)
    render locals: { form_object: password_form }
  end

  def update
    password_form= PasswordForm.new(password_form_params)
    user.attributes = password_form.user_attributes

    if password_form.valid?(user: user)
      user.save
      bypass_sign_in(user)
      redirect_to admin_root_path
    else
      render :edit, locals: { form_object: password_form }, status: :bad_request
    end
  end

  private

  def user
    current_user
  end

  def password_form_params
    params.require(:password_form).permit(
      :user_password,
      :user_password_confirmation
    )
  end
end
