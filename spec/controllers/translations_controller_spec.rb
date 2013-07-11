require 'spec_helper'

describe TranslationsController do

  before { @project = FactoryGirl.create(:project) }

  # --------------------------------------------------------------------------------------
  describe "GET #index" do
    it "renders the :index view" do
      get :index, :project_id => @project.id
      response.should render_template :index
    end
  end


  # --------------------------------------------------------------------------------------
  describe "POST #load" do
    before do
      create_project_directories(@project.directory, ['dir_a', 'dir_b'])
      post :load,
          :project_id => @project.id,
          :directory => 'test',
          :format => 'json'
    end

    it 'should return JSON status 200' do
      JSON.parse(response.body)[0].should == 200
    end
  end


end
