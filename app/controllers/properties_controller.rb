class PropertiesController < ApplicationController

  include ProjectsHelper
  include PropertiesHelper
  before_filter :get_project_and_properties!

  # ---------------------------------------------------------------------------------------
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end


  # ---------------------------------------------------------------------------------------
  def update
    # Update the content of the configuration.
    @project_property[:name] = params[:property][:name]
    @project_property[:default_language] = params[:property][:default_language]

    # Write it.
    update_config(@project, @project_property)

    # And redirect.
    redirect_to projects_path
  end

end
