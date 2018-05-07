Rails.application.routes.draw do
  root to: 'pages#home'
  resources :drafts, only: [:show]
end
