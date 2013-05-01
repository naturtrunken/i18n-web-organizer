class Project < ActiveRecord::Base
  attr_accessible :name, :default_language, :directory

  # ---------------------------------------------------------------------------------------
  validates                 :name, presence: true
  validates_uniqueness_of   :name, { :case_sensitive => false }

  # ---------------------------------------------------------------------------------------
  validates                 :directory, presence: true

  # ---------------------------------------------------------------------------------------
  validates                 :default_language, presence: true

end
