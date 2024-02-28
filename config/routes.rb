Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  authenticated :user do
    root "groups#index", as: :authenticated_root
  end

  # Defines the root path route ("/")
 
  unauthenticated do
    root "users#index", as: :unauthenticated_root
  end

  resources :groups, only: [:index, :new, :create] do  
    resources :payments, only: [:index, :new, :create] 
  end
end
