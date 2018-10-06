class Admin::PasswordsController < AdminController
  def edit
    @form_object = PasswordForm.new(user: user)
  end

  def update
    @form_object = PasswordForm.new(password_form_params)
    user.attributes = @form_object.user_attributes

    if @form_object.valid?(user: user)
      user.save
      bypass_sign_in(user)
      redirect_to admin_root_path
    else
      render :edit, status: :bad_request
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
