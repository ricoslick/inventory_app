Rails.application.routes.draw do
  
	resources :users
	resources :sessions, only: [:new, :create, :destroy]
	resources :account_activations, only: [:edit]
	resources :password_resets,		only: [:new, :create, :edit, :update] 
	resources :devices,	only: [:create, :destroy, :edit, :update] 
	resources :customers, only: [:new, :index, :create, :destroy, :edit, :update] # add edit later

	root to: 'static_pages#home', via:  :get

	match '/signup', to: 'users#new', via: :get
	match '/signin', to: 'sessions#new', via: :get
	match '/signout', to: 'sessions#destroy', via: :delete
	match '/devices', to: 'devices#new', via: :get

	match '/help', to: 'static_pages#help', via: :get

	match '/about', to: 'static_pages#about', via: :get

	match '/contact', to: 'static_pages#contact', via: :get

	match '/inventory', to: 'static_pages#inventory', via: :get





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
