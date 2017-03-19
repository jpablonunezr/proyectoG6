Rails.application.routes.draw do
 
  resources :networks
  resources :materials
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  root 'materials#index'

end
