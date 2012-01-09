class Link < ActiveRecord::Base
  has_one :submission, :as => :content, :dependent => :destroy

  def sets= attributes
    self.url = attributes[:url]
  end
end
