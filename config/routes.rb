Rails.application.routes.draw do
  root to: 'drafts#index'
  resources :drafts, only: [:show]
end
