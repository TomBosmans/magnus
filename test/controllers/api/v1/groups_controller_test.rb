describe Api::V1::GroupsController do
  describe 'GET #index' do
    it 'responses with status success (200)' do
      sign_in user

      create_list(:group, 5)
      get api_v1_groups_url

      assert_response :success
    end
  end

  describe 'GET #show' do
    it 'responses with status success (200)' do
      sign_in user

      group = create(:group)
      get api_v1_group_url(group)

      assert_response :success
    end
  end
end
