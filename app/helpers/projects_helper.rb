require "yaml"

module ProjectsHelper

  # Fetches the project from the ID in the url.
  # Throws an error, if there is no one.
  # ---------------------------------------------------------------------------------------
  def get_project_and_properties!
    raise 'No :project_id is given in the URL.' unless params[:project_id]

    @project = Project.where('id = ?', params[:project_id]).first
    raise 'No such project does exists for the given :project_id in the URL.' unless @project
    raise 'No such project directory does exists for the given :project_id: ' + @project.directory unless Dir.exists?(@project.directory)

    @project_property = get_project_properties(@project)
  end


  # Loads the project properties for the given projects and returns them in an array.
  # ---------------------------------------------------------------------------------------
  def get_projects_properties(projects)
   properties = []

   projects.each do |project|
    properties.push(get_project_properties(project))
   end

   return properties
  end


  # Loads the project properties for the given projects and returns them in an array.
  # ---------------------------------------------------------------------------------------
  def get_project_properties(project)

    # Make sure that we do have a directory in the proper format and can write into it.
    raise 'There was no directory given.' unless project.directory
    raise 'The directory does not exist.' unless File.directory?(project.directory)
    raise 'Can not write in the directory.' unless File.writable?(project.directory)

    # Does a configuration file in the project's directory still exists?
    unless File.readable?(project.directory + '.i18n-web-organizer') then

      # Oops... OK, we have to create an entry for this project anyway,
      # but we can only write placeholder informations now.
      return {
          :name => '(Unknown)',
          :default_language => '',
          :languages => []
      }

    end

    # OK, open and read the file.
    file_properties = YAML.load_file(project.directory + '.i18n-web-organizer')

    return {
        :name => file_properties[:name],
        :default_language => file_properties[:default_language],
        :languages => file_properties[:languages]
    }
  end

end
