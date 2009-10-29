class HomepagesController < ApplicationController
  def index
    @users  = User.all
  end
end
