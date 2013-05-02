I18nWebOrganizer::Application.routes.draw do
  root to: 'projects#index'

  resources :projects, :except => [:show, :edit, :update] do
    resources :properties, :only => [:index]
    resources :translations, :only => [:index]
  end

  match 'projects/:project_id/properties'  => 'properties#update', via: :post
  match 'projects/:project_id/properties/add_language'  => 'properties#add_language', as: 'update_project_properties', via: :post

end
