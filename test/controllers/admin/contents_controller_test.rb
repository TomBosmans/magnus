require 'test_helper'

class Admin::Groups::ContentsControllerTest < ActionDispatch::IntegrationTest
  Content.types.each do |type|
    def create_content(type)
      create(singular_key(type))
    end

    def build_content(type)
      build(singular_key(type))
    end

    # :article
    def singular_key(type)
      type.to_s.underscore.to_sym
    end

    # :articles
    def plural_key(type)
      type.to_s.underscore.pluralize.to_sym
    end

    def group
      @group ||= create(:group)
    end

    # Using the form factory to build a valid params hash
    def build_params(type)
      hash = build("#{singular_key(type)}_form").
               public_send("#{singular_key(type)}_attributes")

      hash = hash.each_with_object({}) do |(key, value), object|
        object["#{singular_key(type)}_#{key}"] = value
      end

      { "#{singular_key(type)}_form".to_sym => hash }
    end

    test "show for type #{type}" do
      sign_in user

      content = create_content(type)
      get url_for([:admin, content.group, content])
      assert_response :found
    end

    test "new for type #{type}" do
      sign_in user

      get url_for([:new, :admin, group, singular_key(type)])
      assert_response :success
    end

    test "create for type #{type}" do
      sign_in user

      post url_for([:admin, group, plural_key(type)]), params: build_params(type)
      assert_redirected_to [:admin, group, Content.last]
    end

    test "edit for type #{type}" do
      sign_in user

      content = create(singular_key(type))
      get url_for([:edit, :admin, group, content])
      assert_response :success
    end

    test "update for type #{type}" do
      sign_in user

      name = 'different name'
      content = create(singular_key(type), name: name)
      params = {
        "#{singular_key(type)}_form".to_sym => {
          "#{singular_key(type)}_name".to_sym => name
        }
      }

      get url_for([:admin, group, content]), params: params
      assert_redirected_to [:admin, group, content]
      assert_equal content.reload.name, name
    end

    test "destroy for type #{type}" do
      sign_in user

      content = create_content(type)
      delete url_for([:admin, group, content])
      assert_redirected_to [:admin, group]
      assert_nil Content.find_by(id: content.id)
    end
  end
end
