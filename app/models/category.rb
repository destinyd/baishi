class Category < ActiveRecord::Base
  has_many  :topics
  acts_as_tree :order => "name"
  validates_presence_of :name
end
