Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  root to: "users#index"

  resources :users, only: %i[index show destroy] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[new create destroy]
      resources :likes, only: %i[new create destroy]
    end
  end

  namespace :api do
    namespace :v1 do
      post :login, to: "authentication#login"
      post :signup, to: "signup#register"
      resources :users do
        resources :posts do
          resources :comments
        end
      end
    end
  end
end
