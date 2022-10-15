Rails.application.routes.draw do
  devise_for :users
  resources :tasks
  post "tasks/:id/toggle", to: "tasks#toggle"
  root "tasks#index"
end
