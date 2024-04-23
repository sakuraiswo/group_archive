Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :rooms, only: %i[index new create] do
    resources :chats, only: %i[create]
  end
end
