class ProjectsController < ApplicationController
  before_filter :with_user
  # GET /projects
  # GET /projects.xml
  def index
    @projects = current_user.projects
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @project = current_user.projects.find(params[:id])
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    @project = current_user.projects.new(:body => Body.new)
  end

  # GET /projects/1/edit
  def edit
    @project = current_user.projects.find(params[:id])
  end

  # POST /projects
  # POST /projects.xml
  def create
    @project = current_user.projects.new(params[:project])

    respond_to do |format|
      if @project.save
        flash[:notice] = 'Project was successfully created.'
        format.html { redirect_to(@project) }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    @project = current_user.projects.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        flash[:notice] = 'Project was successfully updated.'
        format.html { redirect_to(@project) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = current_user.projects.find(params[:id])
    @project.destroy
  end
end
