Rails.application.routes.draw do
  root to: 'pages#home'

  resources :cocktails, only: [:index, :show, :new, :create] do
      resources :doses, only: [:index, :new, :create]
  end
   resources :doses, only: :destroy # :edit, :update
end
