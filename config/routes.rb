I18nWebOrganizer::Application.routes.draw do
  root to: 'projects#index'

  resources :projects, :except => [:show, :edit, :update] do
    resources :translations, :only => [:index]
  end

end
