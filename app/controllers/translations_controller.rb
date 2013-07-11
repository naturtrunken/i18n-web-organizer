class TranslationsController < ApplicationController

  include TranslationsHelper
  include ProjectsHelper
  before_filter :get_project_and_properties!

  # ---------------------------------------------------------------------------------------
  def index
    # Build the configuration hash for the view.
    @translation_config = Hash.new

    # The current path
    @translation_config[:current_path] = '/'

    # An array of all (sub-) directories within the project's path.
    # We remove the project's path itself and the trailing '/' in the map code.
    @translation_config[:available_paths] = Dir.glob(@project.directory + "**/*/").map { |dir| dir[@project.directory.length..dir.length-2] }

    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end


  # ---------------------------------------------------------------------------------------
  def load
    json_response([200, [params[:directory]]])
  end

end
