class Link < ActiveRecord::Base
  has_one :submission, :as => :content, :dependent => :destroy
end