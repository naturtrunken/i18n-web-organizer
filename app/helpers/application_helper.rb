module ApplicationHelper

  # ---------------------------------------------------------------------------------------
  def json_response(code)
    respond_to do |format|
      format.json { render :json => code }
    end
  end


end
