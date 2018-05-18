class Admin::ContentsController < AdminController
  def show
    content = Content.find(params[:id])
    @presenter = presenter_class.new(content)
  end

  def new
    @form_object = form_object_class.new
  end

  def create
    @form_object = form_object_class.new(content_form_params)
    @content = @form_object.build_for(group)

    if @form_object.valid?(type_name => @content)
      @content.save
      redirect_to [:admin, @content]
    else
      render :new
    end
  end

  def edit
    content = Content.find(params[:id])
    @form_object = form_object_class.new(type_name => content)
  end

  def update
    @content = Content.find(params[:id])
    @form_object = form_object_class.new(content_form_params)
    @content.attributes = @form_object.public_send("#{type_name}_attributes")

    if @form_object.valid?(type_name => @content)
      @content.update_attributes(
        @form_object.public_send("#{type_name}_attributes")
      )

      redirect_to [:admin, @content]
    else
      render :edit
    end
  end

  def destroy
    @content = Content.find(params[:id])
    group = @content.group
    @content.destroy
    redirect_to [:admin, group]
  end

  private

  def group
    @group ||= Group.find(params[:group_id])
  end

  # example: "ArticleForm"
  def form_object_class
    "#{type}Form".constantize
  end

  # example: "ArticlePresenter"
  def presenter_class
    "#{type}Presenter".constantize
  end

  # example: "Article"
  def type
    params[:type]
  end

  # example: Article
  def type_class
    type.constantize
  end

  # example: "article"
  def type_name
    type.underscore
  end

  # The form objects filter all unwanted params.
  def content_form_params
    form_param = "#{type_name}_form".to_sym
    params.require(form_param).permit!
  end
end
