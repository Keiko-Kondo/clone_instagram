Rails.application.routes.draw do
  root 'users#new'
  resources :pictures do
    collection do
      post :confirm
    end
  end
  resources :users do
    collection do
      post :confirm
    end
  end
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy, :index]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
