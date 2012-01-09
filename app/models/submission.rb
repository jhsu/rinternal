class Submission < ActiveRecord::Base
  belongs_to :content, :polymorphic => true

  def self.create_type(type, attributes={})
    if klass = %w(link discussion).detect {|klass| klass == type }
      klass = klass.constantize
      instance = new(title: attributes.delete(:title))
      if instance.valid?
        instance.content = klass.create(attributes)
        instance.save
        instance
      end
    end
  end
end
