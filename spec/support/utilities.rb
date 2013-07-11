def create_project_directories(base_dir, dirs)
  dirs.each do |dir|
    Dir.mkdir(base_dir + dir) unless Dir.exists?(base_dir + dir)
  end
end
