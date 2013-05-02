require 'spec_helper'

describe "projects/properties/index" do

  before { @project = FactoryGirl.create(:project) }

  describe 'Index page', :js => true do
    before { visit project_properties_path(@project) }
    subject { page }

    describe 'adding a new language' do
      before do
        @new_language = I18n.t('languages').map{ |e| [e[0].to_s, e[1].to_s] }.sample
        select @new_language[1], :from => 'project_properties_language'
        click_button 'project_properties_language-add'
      end

      it { should have_selector('#project_properties_language-' + @new_language[0]) }
    end
  end


end
