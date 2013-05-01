require "yaml"

module ProjectsHelper

  # Creates the initial config file in the given directory.
  # ---------------------------------------------------------------------------------------
  def create_initial_config_file!(directory, project_name, default_language)

    # Make sure that we do have a directory in the proper format and can write into it.
    directory = directory + '/' unless directory[-1] == '/'
    raise 'The directory does not exist.' unless File.directory?(directory)
    raise 'Can not write in the directory.' unless File.writable?(directory)

    # Create the initial configuration hash.
    config = {
      'name' => project_name,
      'default_language' => default_language
    }

    # Write the data.
    File.open(directory + '.i18n-web-organizer', 'w') do |f|
      YAML.dump(config, f)
    end

  end

end
