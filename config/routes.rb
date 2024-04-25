Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'

  resources :rooms, only: %i[index new create] do
    resources :question_sheets, only: %i[create destroy] do
      resources :options
    end
    post 'save-image', to: 'archives#create', as: 'save_image'
    resources :archives, only: %i[create destroy]
    resources :chats, only: %i[index create destroy] do
      member do
        get 'stream'
      end
    end
  end
end
