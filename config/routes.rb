Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cohorts
  resources :users

  root to: 'cohorts#index'
end
