class Project < ActiveRecord::Base
  has_many :tasks
  belongs_to :user
  belongs_to  :body
  accepts_nested_attributes_for :body
  def body_text
    body.body
  end
end
