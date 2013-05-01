require 'spec_helper'

describe TranslationsController do
  describe "routing" do

    before { @project = FactoryGirl.create(:project) }

    it "route to #index" do
      {:get => '/projects/' + @project.id.to_s + '/translations' }.should route_to(
       :controller => "translations",
       :project_id => @project.id.to_s,
       :action => "index"
      )
    end

  end
end
