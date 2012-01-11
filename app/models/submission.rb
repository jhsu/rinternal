class Submission < ActiveRecord::Base
  belongs_to :content, :polymorphic => true
  belongs_to :user

  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings

  scope :of, lambda {|user| where("submissions.user_id = ?", user.id) }

  validates_presence_of :title

  def self.create_type(type, attributes={})
    if klass = %w(link discussion).detect {|klass| klass == type }
      klass = klass.camelize.constantize
      instance = new(title: attributes.delete(:title), 
                     user: attributes.delete(:user))
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
