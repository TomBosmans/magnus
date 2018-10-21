require 'test_helper'

describe Api::V1::ContentsController do
  Content.types.each do |type|
    before { @type = type }

    context type.to_s do
      describe 'GET #index' do
        it 'responses with status success (200)' do
          sign_in user

          create_list(singular_key, 5)
          get url_for([:api, :v1, plural_key])

          assert_response :success
        end

        it 'resturns the expected data' do
          sign_in user

          contents = create_list(singular_key, 5)
          get url_for([:api, :v1, plural_key])
          json = JSON.parse(response.body)

          contents.map! { |content| presenter_for content }
          contents.each do |content|
            json_content = json.detect { |hash| hash['id'] == content.id }
            assert_content(json_content, content)
          end
        end
      end

      describe 'GET #show' do
        it 'responses with status success (200)' do
          sign_in user

          content = create(singular_key)
          get url_for([:api, :v1, content])

          assert_response :success
        end

        it 'returns expected data' do
          sign_in user

          content = presenter_for(create(singular_key))
          get url_for([:api, :v1, content])
          json = JSON.parse(response.body)

          assert_content(json, content, details: true)
        end
      end
    end
  end

  private

  attr_reader :type

  # :article
  def singular_key
    type.to_s.underscore.to_sym
  end

  # :articles
  def plural_key
    type.to_s.underscore.pluralize.to_sym
  end

  def presenter_for(object)
    klass = "#{type}Presenter".constantize
    klass.new object
  end

  def assert_content(json, content, details: false)
    assert_equal json['id'], content.id
    assert_equal json['name'], content.name
    assert_equal json['createdAt'], content.created_at
    assert_equal json['updatedAt'], content.updated_at
    assert_creator(json['creator'], content.creator)
    return unless details
    content.fields.each do |key, value|
      assert_equal json[key.camelize(:lower)], content.public_send(key)
    end
  end

  def assert_creator(json, creator)
    assert_equal json['id'], creator.id
    assert_equal json['name'], creator.name
    assert_equal json['email'], creator.email
  end
end
