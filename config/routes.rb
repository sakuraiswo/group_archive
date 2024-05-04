Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'

  resources :rooms, only: %i[index new create update show] do
    resources :question_sheets, only: %i[index create destroy show] do
      resources :answers, only: [:create]
      resources :options
    end
    post 'save-image', to: 'archives#create', as: 'save_image'
    resources :archives, only: [:destroy]  # createアクションを除去
    resources :memos, only: %i[create update]
    resources :chats, only: %i[index create destroy] do
      member do
        get 'stream'
      end
    end
  end
end
