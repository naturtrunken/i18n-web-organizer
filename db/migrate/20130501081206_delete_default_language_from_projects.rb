class DeleteDefaultLanguageFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :default_language
  end
end
