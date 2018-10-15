require 'test_helper'

describe Admin::GroupsController do
  describe 'GET #show' do
    it 'responses with status success (200)' do
      sign_in user

      group = create(:group)
      get admin_group_url(group)

      assert_response :success
    end
  end
end
