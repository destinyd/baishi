require 'digest/sha1'

class User < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken

  validates_presence_of     :login
  validates_length_of       :login,    :within => 3..40
  validates_uniqueness_of   :login
  validates_format_of       :login,    :with => Authentication.login_regex, :message => Authentication.bad_login_message

  validates_format_of       :name,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :name,     :maximum => 100

  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email
  validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message

  

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :name, :password, :password_confirmation

  #for thissite
  #RELATIONS  = {:friends  =>  0,  :employers  =>  1,  :employees =>  2 }
  has_many  :topics,:order => 'id desc'
  has_many  :relations
  has_many  :followings,  :through => :relations#,:source => :user
  has_many  :followers_relations, :class_name => 'Relation', :foreign_key => 'to_id'
  has_many  :followers, :through => :followers_relations, :source => :user

  def new_following(user_id)
    self.relations.create(:to_id  =>  user_id)
  end

  def to_param
    self.login
  end
  #  RELATIONS.each do |k,v|
  #    class_eval do
  #      has_many  "#{k}_relations" ,:class_name => 'Relation',:conditions => {:rtype =>  v}
  #      has_many "#{k}",:through => "#{k}_relations",:class_name => 'User', :foreign_key => 'to_id',:source => :user
  #    end
  #    self.class_eval <<-END
  #        def new_#{k}(t)
  #          r = self.relations.create(:rtype  =>  #{v},:to_id =>  t.id)
  #        end
  #      END
  #  end






  def self.authenticate(login, password)
    return nil if login.blank? || password.blank?
    u = find_by_login(login.downcase) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def login=(value)
    write_attribute :login, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end

  def username
    self.name.blank? ? self.login : self.name
  end

  protected
    


end
