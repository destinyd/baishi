class Project < ActiveRecord::Base
  has_many :tasks
  belongs_to :user
  belongs_to  :body
  accepts_nested_attributes_for :body
  named_scope :recent,:limit => 10, :order => 'id desc'
  def body_text
    body.body
  end
end
