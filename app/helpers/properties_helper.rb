require "yaml"

module PropertiesHelper

  # Writes the configuration file for the given project.
  # ---------------------------------------------------------------------------------------
  def update_config(project, config)
   File.open(project.directory + '.i18n-web-organizer', 'w') do |f|
    YAML.dump(config, f)
   end
  end


end

