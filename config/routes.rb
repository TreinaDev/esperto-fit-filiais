Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :plans, only: %i[index new create show]
  resources :subsidiaries, only: %i[index show new create]
  resources :enrollments, only: %i[index show]
end
