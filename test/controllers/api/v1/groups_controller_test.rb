describe Api::V1::GroupsController do
  describe 'GET #index' do
    it 'responses with status success (200)' do
      sign_in user

      create_list(:group, 5)
      get api_v1_groups_url

      assert_response :success
    end

    it 'returns the expected data' do
      sign_in user

      groups = create_list(:group, 5)
      get api_v1_groups_url
      json = JSON.parse(response.body)

      groups.each do |group|
        json_group = json.detect { |hash| hash['id'] == group.id }
        assert_group(json_group, group, show_items: false)
      end
    end
  end

  describe 'GET #show' do
    it 'responses with status success (200)' do
      sign_in user

      group = create(:group)
      get api_v1_group_url(group)

      assert_response :success
    end

    it 'returns the expected data' do
      sign_in user

      group = create(:group)
      get api_v1_group_url(group)
      json = JSON.parse(response.body)
      assert_group(json, group, show_items: true)
    end
  end

  private

  def assert_group(json, group, show_items: false)
    assert json.present?
    assert_equal json['id'], group.id
    assert_equal json['name'], group.name
    assert_equal json['description'], group.description
    return unless show_items
    group.items.each do |item|
      json_item = json_for_item(json, item)
      assert_item(json_item, item)
    end
  end

  def assert_item(json, item)
    assert json.present?
    assert_equal json['id'], item.id
    assert_equal json['name'], item.name
    assert_equal json['type'], item.class.type
  end

  def json_for_item(json, item)
    json_item = json['items'].detect do |hash|
      hash['id'] == item.id && hash['type'] == item.class.to_s
    end
  end
end
