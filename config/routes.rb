Rails.application.routes.draw do


	mount Attachinary::Engine => "/attachinary"
	devise_for :users
	root to: 'pages#home'
  get '/dashboard', to: 'users#dashboard'
  get '/dashboard/edit', to: 'users#edit'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trees do
    resources :bookings, only: [:new, :create, :show ]
  end
end



