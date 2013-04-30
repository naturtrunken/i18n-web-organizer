class AddDefaultLanguageToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :default_language, :string
  end
end
