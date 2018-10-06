require 'test_helper'

class Admin::Groups::ContentsControllerTest < ActionDispatch::IntegrationTest
  Content.types.each do |type|
    def create_content(type)
      create(type.to_s.underscore)
    end

    test "show for type #{type}" do
      sign_in user

      content = create_content(type)
      get url_for([:admin, content.group, content])
      assert_response :success
    end
  end
end
