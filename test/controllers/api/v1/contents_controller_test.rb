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
      end

      describe 'GET #show' do
        it 'responses with status success (200)' do
          sign_in user

          content = create(singular_key)
          get url_for([:api, :v1, content])

          assert_response :success
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
end
