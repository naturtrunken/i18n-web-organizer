I18nWebOrganizer::Application.routes.draw do
  root to: 'projects#index'

  resources :projects, :except => [:show, :edit, :update] do
    resources :properties, :only => [:index]
    resources :translations, :only => [:index]
  end

  match 'projects/:project_id/properties'  => 'properties#update', via: :post

end
