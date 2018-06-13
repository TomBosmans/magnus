class Api::V1::ContentsController < ApiController
  def index
    contents = type_class.all
    jbuilder = ContentJbuilder.index(contents)

    json_response jbuilder.target!
  end

  def show
    content = type_class.find(params[:id])
    jbuilder = ContentJbuilder.show(content)

    json_response jbuilder.target!
  end

  private

  def type
    params[:type]
  end

  def type_class
    type.constantize
  end
end
