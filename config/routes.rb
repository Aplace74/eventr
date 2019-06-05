Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] do
    collection do
      get 'dashboard', to: 'users#dashboard', as: :dashboard
    end
  end

  resources :events, except: [:show] do
    resources :contributions, only: [:index, :create, :update, :destroy]
    resources :participations, only: [:index, :update, :destroy]
    resources :supplies, only: [:index, :create, :update, :destroy]
  end

  # static pages
  get "/composants" => "pages#composants"

end
