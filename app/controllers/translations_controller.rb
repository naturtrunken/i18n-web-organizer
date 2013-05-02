class TranslationsController < ApplicationController

  include TranslationsHelper
  include ProjectsHelper
  before_filter :get_project_and_properties!

  # ---------------------------------------------------------------------------------------
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

end
