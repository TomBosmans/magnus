class Content
  class UpdateService < ApplicationService
    include TypeConcern

    def initialize(content, params)
      @content = content
      @params = params
    end

    def execute
      @updated_content = update_content if valid?
      return content, form_object
    end

    private

    attr_reader :content, :params, :updated_content

    def update_content
      content.update_attributes(
        form_object.public_send("#{type_name}_attributes")
      )
    end

    def form_object
      @form_object ||=
        form_object_class.new(params)
    end

    def valid?
      form_object.valid?(type_name => content)
    end
  end
end
