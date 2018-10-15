class Admin::UsersController < AdminController
  def index
    users = User.all
    user_table = UserTable.new(users)
    render locals: { table_object: user_table }
  end

  def new
    user_form= UserForm.new
    render locals: { form_object: user_form }
  end

  def create
    user_form = UserForm.new(user_form_params)
    user = User.new(user_form.user_attributes)

    if user_form.valid?(user: user)
      user.save
      redirect_to [:admin, :users]
    else
      render :new, locals: { form_object: user_form }, status: :bad_request
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to [:admin, :users]
  end

  private

  def user_form_params
    params.require(:user_form).permit(
      :user_email,
      :user_password,
      :user_password_confirmation
    )
  end
end
