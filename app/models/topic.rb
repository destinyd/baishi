class Topic < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :body
  belongs_to  :category
  has_many    :comments,:class_name => 'Comment',  :as => :parent ,:order => 'id desc'

  accepts_nested_attributes_for :body

  def body_text
    body.body
  end

end
