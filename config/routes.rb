Rails.application.routes.draw do
 
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :networks
  resources :materials do
  	collection do
  		get 'all'
  	end
	end 
  
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  resources :users, only: [:index, :show]
  
  root 'materials#index'

end
