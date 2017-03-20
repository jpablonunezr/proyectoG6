Rails.application.routes.draw do
 
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :networks
  resources :materials do
  	collection do
  		get 'all'
  	end
    post 'add_comment'
	end 
  
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  resources :users, only: [:index, :show] do
    collection do
      get 'collaborate'
    end
    member do
      get 'add_collaborate'
    end
  end
  
  root 'materials#index'

end
