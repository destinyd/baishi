class Relation < ActiveRecord::Base
  belongs_to :user
  belongs_to :following,  :class_name => 'User', :foreign_key => 'to_id'
  belongs_to :follower,  :class_name => 'User', :foreign_key => 'user_id'

  validates_uniqueness_of :user_id, :scope => [:user_id,:to_id]

  private

end
