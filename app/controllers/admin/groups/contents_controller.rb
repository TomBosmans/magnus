require 'content_manager'

class Admin::Groups::ContentsController < AdminController
  def show
    @content = presenter_class.new(Content.find(params[:id]))
  end

  def new
    @form_object = form_object_class.new
  end

  def create
    @form_object, @content = create_servive_class.execute(
      group: group,
      form_object: form_object_class.new(content_form_params)
    )

    if @content.persisted?
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
    @form_object, @content = update_service_class.execute(
      content: Content.find(params[:id]),
      form_object: form_object_class.new(content_form_params)
    )

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
    destroy_service_class.execute(content: @content)
    redirect_to [:admin, group]
  end

  private

  def group
    @group ||= Group.find(params[:group_id])
  end

  def type_manager
    @manager ||= ContentManager.new(params[:type])
  end

  def form_object_class
    type_manager.form_object_class
  end

  def presenter_class
    type_manager.presenter_class
  end

  def create_service_class
    type_manager.create_service_class
  end

  def update_service_class
    type_manager.update_service_class
  end

  def destroy_service_class
    type_manager.destroy_service_class
  end

  # The form objects filter all unwanted params.
  def content_form_params
    params.require(type_manager.form_param_key).permit!
  end
end
