class Content
  class DestroyService
    def initialize(content:)
      @content = content
    end

    def execute
      content.destroy
      content
    end

    private

    attr_reader :content
  end
end
