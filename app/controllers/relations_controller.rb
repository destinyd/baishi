class RelationsController < ApplicationController
  def index
    @followings = current_user.followings
    @followers  = current_user.followers
  end
  
  def create
    begin
    current_user.new_following params[:following_id]
    rescue ActiveRecord::RecordInvalid
      flash[:warning] = 'already following'
    end
    redirect_back_or_default('/')
  end
  
  def destroy
    current_user.relations.find_by_to_id(params[:following_id]).destroy
    redirect_back_or_default('/')
  end

end
