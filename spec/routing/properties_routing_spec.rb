require 'spec_helper'

describe PropertiesController do
  describe "routing" do

    before { @project = FactoryGirl.create(:project) }

    it "route to #index" do
      {:get => '/projects/' + @project.id.to_s + '/properties' }.should route_to(
       :controller => "properties",
       :project_id => @project.id.to_s,
       :action => "index"
      )
    end

    it "route to #update" do
      { :post => '/projects/' + @project.id.to_s + '/properties' }.should route_to(
       :controller => "properties",
       :project_id => @project.id.to_s,
       :action => "update"
      )
    end

    it "route to #add_language" do
      { :post => '/projects/' + @project.id.to_s + '/properties/add_language' }.should route_to(
        :controller => "properties",
        :project_id => @project.id.to_s,
        :action => "add_language"
      )
    end


  end
end
