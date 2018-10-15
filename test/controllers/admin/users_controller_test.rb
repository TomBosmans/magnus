describe Admin::UsersController do
  describe 'GET #index' do
    it 'responses with status success' do
      sign_in user

      create_list(:user, 5)
      get admin_users_url

      assert_response :success
    end
  end

  describe 'GET #new' do
    it 'responses with status success' do
      sign_in user
      get new_admin_user_url
      assert_response :success
    end
  end

  describe 'POST #create' do
    context 'valid params' do
      it 'redirects to users index' do
        sign_in user

        params = build_params(email: 'new-user@magnus.com')
        post admin_users_url, params: params

        assert_redirected_to admin_users_url
      end

      it 'creates the user' do
        sign_in user
        user_count = User.count

        params = build_params(email: 'new-user@magnus.com')
        post admin_users_url, params: params

        assert_equal (user_count + 1),
                     User.count
      end
    end

    context 'invalid params' do
      it 'returns status bad request' do
        sign_in user
        email = 'test-email@magnus.com'
        create(:user, email: email)

        params = build_params(email: email)
        post admin_users_url, params: params

        assert_response :bad_request
      end
    end

    it 'does not create the user' do
      sign_in user
      email = 'new-user@magnus.com'
      create(:user, email: email)
      user_count = User.count            

      params = build_params(email: email)
      post admin_users_url, params: params

      assert_equal user_count,
                   User.count
    end
  end

  describe 'DELETE #destroy' do
    it 'responses with status success (200)' do
      sign_in user

      user_to_delete = create(:user)
      delete admin_user_url(user_to_delete)

      assert_redirected_to admin_users_url
    end

    it 'destroys the given user' do
      sign_in user

      user_to_delete = create(:user)
      delete admin_user_url(user_to_delete)

      assert_nil User.find_by(id: user_to_delete.id)
    end
  end

  private

  def build_params(email:, password: 'testtest', password_confirmation: 'testtest')
    params = {
      user_form: {
        user_email: email,
        user_password: password,
        user_password_confirmation: password_confirmation
      }
    }
  end
end
