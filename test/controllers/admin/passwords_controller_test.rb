require 'test_helper'

class Admin::PasswordsControllerTest < ActionDispatch::IntegrationTest
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

  test 'edit' do
    sign_in user
    get edit_admin_password_path
    assert_response :success
  end

  test 'update with valid params' do
    sign_in user
    params = build_params(
      password: 'yoloyolo',
      password_confirmation: 'yoloyolo'
    )

    patch admin_password_path, params: params
    assert_redirected_to admin_root_path
  end

  test 'update with invalid params' do
    sign_in user
    params = build_params(
      password: 'yolo',
      password_confirmation: 'yoloworld'
    )

    patch admin_password_path, params: params
    assert_response :bad_request
  end

  test 'params should be present' do
    sign_in user
    params = build_params(
      password: nil,
      password_confirmation: nil
    )

    patch admin_password_path, params: params
    assert_response :bad_request
  end
end
