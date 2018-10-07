module TypeConcern
  def type_class
    self.class.to_s.split('::').first.constantize
  end

  def type_name
    type_class.to_s.underscore.to_sym
  end

  def form_object_class
    "#{type_class}Form".constantize
  end
end
