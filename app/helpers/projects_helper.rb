require "yaml"

module ProjectsHelper

  # Creates the initial config file in the given directory.
  # ---------------------------------------------------------------------------------------
  def create_initial_config_file!(directory, project_name, default_language)

    # Make sure that we do have a directory in the proper format and can write into it.
    raise 'The directory does not exist.' unless File.directory?(directory)
    raise 'Can not write in the directory.' unless File.writable?(directory)

    # Create the initial configuration hash.
    config = {
      :name => project_name,
      :default_language => default_language
    }

    # Write the data. (Because we've normalized the directory string in projects#create,
    # we know that the string ends with a slash.)
    File.open(directory + '.i18n-web-organizer', 'w') do |f|
      YAML.dump(config, f)
    end

  end


  # Loads the project properties for the given projects and returns them in an array.
  # ---------------------------------------------------------------------------------------
  def get_project_properties(projects)
   properties = []

   projects.each do |project|

     # Does a configuration file in the project's directory still exists?
     unless File.readable?(project.directory + '.i18n-web-organizer') then

       # Oops... OK, we have to create an entry for this project anyway,
       # but we can only write placeholder informations now.
       properties.push(
        'name' => '(Unknown)',
        'default_language' => ''
       )

       next
     end

     # OK, open and read the file.
     file_properties = YAML.load_file(project.directory + '.i18n-web-organizer')

     properties.push(
      'name' => file_properties[:name],
      'default_language' => file_properties[:default_language]
     )
   end

   return properties
  end


end
