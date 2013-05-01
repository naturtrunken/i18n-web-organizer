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


end
