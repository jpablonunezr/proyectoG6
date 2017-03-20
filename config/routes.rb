Rails.application.routes.draw do
 
  resources :networks
  resources :materials do
  	collection do
  		get 'all'
  	end
	end 
  
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  resources :users, only: :index
  
  root 'materials#index'

end
