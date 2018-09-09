# User content class unless there is a specific class for the given type.
class ContentManager
  def initialize(type)
    @type = type
  end

  # example: ArticleFrom
  def form_object_class
    ContentForm unless form_object_class_for_type?
    form_object_class_for_type.constantize
  end

  # example: ArticlePresenter
  def presenter_class
    ContentPresenter unless presenter_class_for_type?
    presenter_class_for_type.constantize
  end

  # example: Article::CreateService
  def create_service_class
    Content::CreateService unless create_service_for_type?
    create_service_for_type.constantize
  end

  # example: Article::UpdateService
  def update_service_class
    Content::UpdateService unless update_service_for_type?
    update_service_for_type.constantize
  end

  # example: Article::DestroyService
  def destroy_service_class
    Consten::DestroyService unless destroy_service_for_type?
    destroy_service_for_type.constantize
  end

  # example: :article_form
  def form_param_key
    :content_form unless form_object_for_type?
    "#{type_name}_form".to_sym
  end

  def form_object_for_type?
    ApplicationForm.const_defined?(form_object_for_type)
  end

  def presenter_for_type?
    ApplicationPresenter.const_defined?(presenster_for_type)
  end

  def create_service_for_type?
    ApplicationService.const_defined?(create_service_for_type)
  end

  def update_service_for_type?
    ApplicationService.const_defined?(update_service_for_type)
  end

  def destroy_service_for_type?
    ApplicationService.const_defined?(destroy_service_for_type)
  end

  private

  attr_reader :type

  # example: Article
  def type_class
    type.constantize
  end

  # example: "article"
  def type_name
    type.underscore
  end

  def form_object_for_type
    "#{type}Form"
  end

  def presenter_for_type
    "#{type}Presenter"
  end

  def create_service_for_type
    "#{type}::CreateService"
  end

  def update_service_for_type
    "#{type}::UpdateService"
  end

  def destroy_service_for_type
    "#{type}::DestroyService"
  end
end
