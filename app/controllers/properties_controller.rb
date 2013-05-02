class PropertiesController < ApplicationController

  include ProjectsHelper
  include PropertiesHelper
  before_filter :get_project_and_properties!

  # ---------------------------------------------------------------------------------------
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.js # index.js.erb
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


  # ---------------------------------------------------------------------------------------
  def add_language

    # Check the parameter
    unless params[:language] then
      json_response([422])
      return
    end

    unless I18n.t('language.' + params[:language]) then
      json_response([422])
      return
    end

    # OK, add the new language now to the list and update the config file.
    @project_property[:languages] = [] unless @project_property[:languages]
    @project_property[:languages].push(params[:language])
    update_config(@project, @project_property)

    json_response([200])
  end

end
