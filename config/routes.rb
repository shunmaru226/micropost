Rails.application.routes.draw do
    root to: 'toppages#index'
    
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'   
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :create] do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  member do
    get :followings
    get :followers
   end
    collection do
      get :serach
    end
  end

  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

end