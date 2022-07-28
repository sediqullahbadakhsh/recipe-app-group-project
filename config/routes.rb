Rails.application.routes.draw do
  devise_for :users

	resources :users, only: :index do
		resources :recipes, except: [:edit, :update] do
			resources :recipe_foods, only: [:index, :new, :create, :destroy]
		end
		resources :foods, except: [:edit, :update]
	end
  # Defines the root path route ("/")
  root 'users#index'
end
