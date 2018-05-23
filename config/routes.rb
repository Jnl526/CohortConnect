Rails.application.routes.draw do
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: { invitations: 'invitations', omniauth_callbacks: 'users/omniauth_callbacks' }
  
  post '/invites', to: 'group_invitations#invites'
  delete '/cohorts/remove_user_from_cohort', to: 'cohorts#remove_from_cohort'
  put '/cohorts/add_user_to_admin', to: 'cohorts#add_user_to_admin'
  get '/cohorts/:id/pending_requests', to: 'cohorts#pending_requests'

  resources :cohorts do
    resources :group_invitations
  end  

  get '/users/profile', to: 'users#profile'

  resources :users
  resources :group_invitations

  root to: 'cohorts#index'
end
