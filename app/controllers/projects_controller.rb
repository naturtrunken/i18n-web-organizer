class ProjectsController < ApplicationController

  include ProjectsHelper

  # ---------------------------------------------------------------------------------------
  def index
    @projects = Project.all
    @project_properties = get_project_properties(@projects)

    respond_to do |format|
      format.html # index.html.erb
    end
  end


  # ---------------------------------------------------------------------------------------
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end


  # ---------------------------------------------------------------------------------------
  def create
    # Normalize
    if params[:project] and params[:project][:directory] then
      params[:project][:directory] = params[:project][:directory] + '/' unless params[:project][:directory][-1] == '/'
    end

    @project = Project.new(params[:project])

    create_initial_config_file!(
     params[:project][:directory],
     params[:project_property][:name],
     params[:project_property][:default_language]
    )

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: 'Project was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end


  # ---------------------------------------------------------------------------------------
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
    end
  end


end
