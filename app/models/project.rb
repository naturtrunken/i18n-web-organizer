class Project < ActiveRecord::Base
  attr_accessible :directory

  # ---------------------------------------------------------------------------------------
  validates                 :directory, presence: true

end
