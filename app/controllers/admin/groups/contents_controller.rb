class Admin::Groups::ContentsController < AdminController
  def show
    content = presenter_for(type_class.find(params[:id]))
    render locals: { content: content }
  end

  def new
    content_form = form_object_for(type_class.new(group: group))
    render locals: { form_object: content_form }
  end

  def create
    content, content_form = create_service_class.execute(content_form_params, group: group)
    if content.persisted?
      redirect_to [:admin, group, content]
    else
      render :new, locals: { form_object: content_form },
             status: :bad_request
    end
  end

  def edit
    content_form = form_object_for(type_class.find(params[:id]))
    render locals: { form_object: content_form }
  end

  def update
    content, content_form = update_service_class.execute(type_class.find(params[:id]), content_form_params)
    if content.errors.empty?
      redirect_to [:admin, group, content]
    else
      render :edit, locals: { form_object: content_form },
             status: :bad_request
    end
  end

  def destroy
    destroy_service_class.execute(type_class.find(params[:id]))
    redirect_to [:admin, group]
  end

  private

  def group
    @group ||= Group.find(params[:group_id])
  end

  # The form objects filter all unwanted params.
  def content_form_params
    params.require(form_param_key).permit!
  end

  def presenter_for(object)
    klass = "#{type}Presenter".constantize
    klass.new object
  end

  def form_object_for(object, params: nil)
    klass = "#{type}Form".constantize

    form_object = klass.new(type_name => object)
    form_object.attributes = params if params
    form_object
  end

  def create_service_class
    "#{type}::CreateService".constantize
  end

  def update_service_class
    "#{type}::UpdateService".constantize
  end

  def destroy_service_class
    "#{type}::DestroyService".constantize
  end

  def form_param_key
    "#{params[:type].underscore}_form".to_sym
  end

  def type
    params[:type]
  end

  def type_name
    type.underscore
  end

  def type_class
    type.constantize
  end
end
