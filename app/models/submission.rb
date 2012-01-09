class Submission < ActiveRecord::Base
  belongs_to :content, :polymorphic => true

  def self.create_type(type, attributes={})
    if klass = %w(link discussion).detect {|klass| klass == type }
      klass = klass.camelize.constantize
      instance = new(title: attributes.delete(:title))
      if instance.valid?
        content = klass.new
        content.sets = attributes
        if content.save
          instance.content = content
          instance.save
        end
        instance
      end
    end
  end
end
