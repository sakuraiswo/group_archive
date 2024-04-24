Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :rooms, only: %i[index new create] do
    resources :archives, only: %i[create destroy]
    resources :chats, only: %i[index create destroy] do
      member do
        get 'stream'
      end
    end
  end
end
