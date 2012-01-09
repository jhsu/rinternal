module ApplicationHelper
  def presents(decorator, instance)
    decorated_object = "#{decorator.to_s.camelize}Decorator".constantize.new(instance)
    yield decorated_object
  end

  def current_user
    @current_user
  end
end
