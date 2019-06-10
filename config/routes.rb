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
    get '/:token/invitation', to: 'events#invitation', as: :invitation
    resources :contributions, only: [:index, :create, :update, :destroy]
    resources :participations, only: [:index, :update, :destroy, :create]
    resources :supplies, only: [:index, :create, :update, :destroy]
  end

  resources :contributions, only: [] do
    post 'change-state', to: 'contributions#change_state'
  end
  

  # static pages
  get "/composants" => "pages#composants"

  # custom error pages
  match "/404", to: "errors#not_found", via: :all
  match "/422", to: "errors#unacceptable", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

end
