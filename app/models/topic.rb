class Topic < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :body
  belongs_to  :category
  has_many    :comments,:class_name => 'Comment',  :as => :parent ,:order => 'id desc'

  accepts_nested_attributes_for :body
  
  named_scope :recent,:order => 'id desc', :limit => 10
  named_scope :with_comments_count, :joins => :comments, :select => "topics.*, count(comments.id) as comments_count", :group  => "topics.id"
  named_scope :with_comments, :include => :comments
  named_scope :with_user, :include => :user

  def body_text
    body.body
  end

end
