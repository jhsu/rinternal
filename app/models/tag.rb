class Tag < ActiveRecord::Base
  has_many :taggings, :dependent => :destroy
  has_many :submissions, :through => :taggings

  validates_presence_of :name
end
