class Discussion < ActiveRecord::Base
  has_one :submission, :as => :content, :dependent => :destroy

  def sets= attributes
    self.text = attributes[:text]
  end
end
