Rails.application.routes.draw do
 
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :networks
  resources :materials do
  	collection do
  		get 'all'
  	end
    get 'add_comment'
    member do
      resources :users, only: [ ] do
        collection do 
          get 'collaborate'
        end
        get 'add_collaborate'
        get 'del_collaborate'
      end
    end
	end 
  
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  resources :users, only: [:index] 
  
  root 'materials#index'

end
