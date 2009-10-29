class Comment < ActiveRecord::Base
  belongs_to :body
  belongs_to :parent, :polymorphic => true
  accepts_nested_attributes_for :body
  
  def body_text
    body.body
  end

end
