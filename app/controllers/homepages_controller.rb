class HomepagesController < ApplicationController
  def index
    @users  = User.recent
    @topics  = Topic.recent
  end

  def blogs
    @topics  = Topic.recent.with_user
  end
end
