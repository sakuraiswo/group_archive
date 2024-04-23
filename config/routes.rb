Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :rooms, only: %i[index new create] do
    resources :chats, only: %i[index create destroy] do
      post :upload_image, on: :collection
    end
  end
end
