module TranslationsHelper

  # Fetches the project from the ID in the url.
  # Throws an error, if there is no one.
  # ---------------------------------------------------------------------------------------
  def get_project!
    raise 'No :project_id is given in the URL.' unless params[:project_id]

    @project = Project.where('id = ?', params[:project_id]).first
    raise 'No such project does exists for the given :project_id in the URL.' unless @project
  end

end
