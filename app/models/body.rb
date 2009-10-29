class Body < ActiveRecord::Base
  has_one :topic
  has_one :comment

  validates_presence_of :body
end
