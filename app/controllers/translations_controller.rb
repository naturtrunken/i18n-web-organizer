class TranslationsController < ApplicationController

  include TranslationsHelper
  before_filter :get_project!

  # ---------------------------------------------------------------------------------------
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

end
