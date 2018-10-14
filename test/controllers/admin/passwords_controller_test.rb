require 'test_helper'

describe Admin::PasswordsController do
  describe 'GET #edit' do
    it 'responses with success' do
      sign_in user
      get edit_admin_password_path
      assert_response :success
    end
  end

  describe 'PATCH #update' do
    context 'valid params' do
      it 'redirects to admin root path' do
        sign_in user
        params = build_params(
          password: 'yoloyolo',
          password_confirmation: 'yoloyolo'
        )

        patch admin_password_path, params: params
        assert_redirected_to admin_root_path
      end
    end

    context 'invalid params' do
      it 'responses with bad request when pw confirmation does not match pw' do
        sign_in user
        params = build_params(
          password: 'yolo',
          password_confirmation: 'yoloworld'
        )

        patch admin_password_path, params: params
        assert_response :bad_request
      end

      it 'responses with bad request when pw is not filled in' do
        sign_in user
        params = build_params(
          password: nil,
          password_confirmation: nil
        )

        patch admin_password_path, params: params
        assert_response :bad_request
      end
    end
  end

  private

  def user
    @user ||= create(:user)
  end

  def build_params(password:, password_confirmation:)
    {
      password_form: {
        user_password: password,
        user_password_confirmation: password_confirmation
      }
    }
  end
end
