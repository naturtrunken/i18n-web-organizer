I18nWebOrganizer::Application.routes.draw do
  root to: 'projects#index'

  resources :projects
end
