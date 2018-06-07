class Admin::UsersController < AdminController
  def index
    users = User.all
    @table_object = UserTable.new(users)
  end

  def new
    @form_object = UserForm.new
  end

  def create
    @form_object = UserForm.new(user_form_params)
    @user = User.new(@form_object.user_attributes)

    if @form_object.valid?(user: @user)
      @user.save
      redirect_to [:admin, :users]
    else
      render :new
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
