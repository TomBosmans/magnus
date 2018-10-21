class Content
  class CreateService < ApplicationService
    include TypeConcern

    def initialize(params, group: nil, creator: nil)
      @params = params
      @content = type_class.new(group: group, creator: creator)
    end

    def execute
      build_content
      save_content if valid?
      return content, form_object
    end

    private

    attr_reader :group, :params, :content

    def form_object
      @form_object ||= form_object_class.new(params)
    end

    def build_content
      content.attributes = form_object.public_send("#{type_name}_attributes")
    end

    def valid?
      form_object.valid?(type_name => content)
    end

    def save_content
      content.save!
    end
  end
end
