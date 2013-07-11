Given(/^that the following projects exist:$/) do |table|
  table.hashes.each do |row|
    # Create the project's directory.
    if Dir.exists?(row['Directory'])
      FileUtils.rm(row['Directory'] + '.i18n-web-organizer') if File.exists?(row['Directory'] + '.i18n-web-organizer')
    else
      Dir.mkdir(row['Directory'])
    end

    # Create the project
    visit new_project_path
    fill_in 'project_directory', with: row['Directory']
    click_button 'Create Project'

    # Create the property for this project.
    page.find("#project_properties-" + Project.where('directory = ?', row['Directory']).first.id.to_s).click
    fill_in 'property_name', with: row['Name']
    select row['Default language'], :from => 'property_default_language'

    # Add a target language
    select row['Target language 1'], :from => 'project_properties_language'
    click_button 'project_properties_language-add'

    # Add a target language
    select row['Target language 2'], :from => 'project_properties_language'
    click_button 'project_properties_language-add'

    click_button 'Save'
  end
end


And(/^there are the following directories in "(.*?)":$/) do |arg1, table|
  table.hashes.each do |row|
    Dir.mkdir(arg1 + '/' + row['Name']) unless Dir.exists?(arg1 + '/' + row['Name'])
  end
end


When(/^the user visits the translation view for the project in the directory "(.*?)",$/) do |arg1|
  visit project_translations_path(Project.where('directory = ?', arg1).first.id)
end


And(/^he choose the directory "(.*?)",$/) do |arg1|
  select arg1, :from => 'translations_path'
  click_button 'translations_path-change'
end


Then(/^he sees the translation page for the directory "(.*?)"\.$/) do |arg1|
  page.should have_selector('#translations_path-current', :text => arg1)
end

