require 'test_helper'

describe Admin::Groups::ContentsController do
  Content.types.each do |type|
    before { @type = type }

    context type.to_s do
      describe 'GET #show' do
        it 'responses with success' do
          sign_in user

          content = create_content
          get url_for([:admin, content.group, content])

          assert_response :success
        end
      end

      describe 'GET #new' do
        it 'responses with success' do
          sign_in user

          get url_for([:new, :admin, group, singular_key])
          assert_response :success
        end
      end

      describe 'POST #create' do
        context 'valid params' do
          it 'redirects to contents show page' do
            sign_in user

            post url_for([:admin, group, plural_key]),
                 params: build_params

            assert_redirected_to [:admin, group, Content.last]
          end
        end

        context 'invalid params' do
          it 'responses with bad request (400)' do
            sign_in user

            post url_for([:admin, group, plural_key]),
                 params: params_with(name: nil)

            assert_response :bad_request
          end          
        end
      end

      describe 'GET #edit' do
        it 'responses with success (200)' do
          sign_in user

          content = create(singular_key)
          get url_for([:edit, :admin, group, content])

          assert_response :success
        end
      end

      describe 'PATCH #update' do
        context 'valid params' do
          it 'redirects to contents show page' do
            sign_in user

            name = 'different name'
            content = create(singular_key, name: 'a name')
            patch url_for([:admin, group, content]),
                  params: params_with(name: name)

            assert_redirected_to [:admin, group, content]
          end

          it 'updated the content' do
            sign_in user

            name = 'different name'
            content = create(singular_key, name: 'a name')
            patch url_for([:admin, group, content]),
                  params: params_with(name: name)

            assert content.reload.name,
                   name
          end
        end

        context 'invalid params' do
          it 'responses with bad request (400)' do
            sign_in user

            content = create(singular_key, name: 'a name')
            patch url_for([:admin, group, content]),
                  params: params_with(name: nil)

            assert_response :bad_request
          end
        end
      end

      describe 'DELETE #destroy' do
        it 'redirects to contents group index' do
          sign_in user

          content = create_content
          delete url_for([:admin, group, content])

          assert_redirected_to [:admin, group]
        end

        it 'deleted the content' do
          sign_in user

          content = create_content
          delete url_for([:admin, group, content])

          assert_nil Content.find_by(id: content.id)
        end
      end
    end
  end

  private

  attr_reader :type

  def create_content
    create(singular_key)
  end

  def build_content
    build(singular_key)
  end

  # :article
  def singular_key
    type.to_s.underscore.to_sym
  end

  # :articles
  def plural_key
    type.to_s.underscore.pluralize.to_sym
  end

  def group
    @group ||= create(:group)
  end

  def params_with(name:)
    params = {
      "#{singular_key}_form" => {
        "#{singular_key}_name": name
      }
    }
  end

  # Using the form factory to build a valid params hash
  def build_params
    hash = build("#{singular_key}_form").
             public_send("#{singular_key}_attributes")

    hash = hash.each_with_object({}) do |(key, value), object|
      object["#{singular_key}_#{key}"] = value
    end

    { "#{singular_key}_form".to_sym => hash }
  end
end
