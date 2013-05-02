require 'spec_helper'

describe PropertiesController do

  before { @project = FactoryGirl.create(:project) }

  # --------------------------------------------------------------------------------------
  describe "GET #index" do
    it "renders the :index view" do
      get :index, :project_id => @project.id
      response.should render_template :index
    end
  end


  # --------------------------------------------------------------------------------------
  describe "POST #update" do
   before { post :update, :project_id => @project.id, :property => { :name => 'test', :default_language => 'de' } }

    it "redirects to the projects index" do
      redirect_to projects_path
    end

  end


  # --------------------------------------------------------------------------------------
  describe "POST #add_language" do
   before { post :add_language, :project_id => @project.id, :language => 'es', :format => 'json' }

   it 'should return a JSON 200' do
     response.body.should == [200].to_json
   end
  end

end
