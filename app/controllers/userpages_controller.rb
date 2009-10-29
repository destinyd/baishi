class UserpagesController < ApplicationController
  before_filter :with_user,:only => [:index]

  def index
    @topics = current_user.topics
  end

  def show
    @user = User.find_by_login params[:blog_id]
    @topics = @user.topics
  end
end
