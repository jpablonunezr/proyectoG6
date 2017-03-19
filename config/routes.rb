Rails.application.routes.draw do
 
  get 'users/index'

  resources :networks
  resources :materials
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  root 'materials#index'

end
