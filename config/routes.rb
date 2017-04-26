Rails.application.routes.draw do
  resources :questions

  devise_for :users

  root "questions#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
