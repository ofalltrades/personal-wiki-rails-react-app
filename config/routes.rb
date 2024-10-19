Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }, path: '', path_names: { sign_in: 'login' }, defaults: { format: :json } 
  # do
  #   get 'login', to: 'users/sessions#new', as: :login
  # end

  resources :wikis
end