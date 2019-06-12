Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] do
    collection do
      get 'dashboard', to: 'users#dashboard', as: :dashboard
    end
  end

  resources :events do
    resources :fees, only: [:create, :index, :update, :destroy]
    get '/:token/invitation', to: 'events#invitation', as: :invitation
    resources :contributions, only: [:index, :create, :destroy, :update]
    resources :participations, only: [:index, :update, :destroy, :create]
    resources :supplies, only: [:index, :create, :update, :destroy]
    resources :fee_contributions, only: [:destroy, :create]
  end
  

  resources :contributions, only: [] do
    post 'change-state', to: 'contributions#change_state'
  end
  

  # static pages
  get "/composants" => "pages#composants"

end
