class UserpagesController < ApplicationController
  before_filter :with_user,:only => [:index]
  def index
    @topics = @user.topics.paginate :page => params[:page]
  end

  def show
    @user = User.find_by_login params[:blog_id] || params[:id]
    @topics = @user.topics.paginate :page => params[:page]
  end
end
