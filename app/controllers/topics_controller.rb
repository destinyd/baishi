class TopicsController < ApplicationController
  before_filter :with_user,:except => [:show]
  layout 'userpages'
  # GET /topics
  # GET /topics.xml
  def index
    @topics = @user.topics
  end

  # GET /topics/1
  # GET /topics/1.xml
  def show
    @user = User.find_by_login params[:blog_id]
    @topic = Topic.find(params[:id])
    @comments = @topic.comments
    @comment  = @comments.new(:parent => @topic)
    @level = @comments.count + 1
  end

  # GET /topics/new
  # GET /topics/new.xml
  def new
    @topic = current_user.topics.new(:body => Body.new)
  end

  # GET /topics/1/edit
  def edit
    @topic = current_user.topics.find(params[:id])
  end

  # POST /topics
  # POST /topics.xml
  def create
    @topic = current_user.topics.new(params[:topic])
    if @topic.save!
      flash[:notice] = 'Topic was successfully created.'
      redirect_to(@topic)
    else
      render :action => "new"
    end
  end

  # PUT /topics/1
  # PUT /topics/1.xml
  def update
    @topic = current_user.topics.find(params[:id])
    if @topic.update_attributes(params[:topic])
      flash[:notice] = 'Topic was successfully updated.'
      redirect_to(@topic)
    else
      render :action => "edit"
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.xml
  def destroy
    @topic = current_user.topics.find(params[:id])
    @topic.destroy
    redirect_to(topics_url)
  end
end
