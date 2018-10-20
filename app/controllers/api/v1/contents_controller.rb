class Api::V1::ContentsController < ApiController
  def index
    contents = type_class.all.map { |content| presenter_for(content) }
    render locals: { contents: contents, type: type }
  end

  def show
    content = presenter_for(type_class.find(params[:id]))
    render locals: { content: content }
  end

  private

  def type
    params[:type]
  end

  def type_class
    type.constantize
  end

  def presenter_for(object)
    klass = "#{type}Presenter".constantize
    klass.new object
  end
end
