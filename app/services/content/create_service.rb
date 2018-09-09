class Content
  class CreateService < ApplicationService
    attr_accessor :content

    def initialize(form_object:, group:)
      @form_object = form_object
      @group = group
    end

    def execute
      build_content
      save_content if valid?
      return form_object, content
    end

    private

    attr_reader :form_object, :group

    def build_content
      form_object.build_for(group)
    end

    def valid?
      form_object.valid?(content: content)
    end

    def save_content
      content.save!
    end
  end
end
