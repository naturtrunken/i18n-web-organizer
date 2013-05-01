class AddDirectoryToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :directory, :string
  end
end
