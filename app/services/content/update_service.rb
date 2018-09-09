class Content
  class UpdateService < ApplicationService
    attr_accessor :content, :form_object

    def initialize(content:, form_object:)
      @content = content
      @form_object = form_object
    end

    def execute
    end

    private

    def update_content
      content.update_attributes(form_object.content_attributes)
    end

    def valid?
      @form_object.valid?(type_name => @content)
    end
  end
end
