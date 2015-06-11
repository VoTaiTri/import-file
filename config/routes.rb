Rails.application.routes.draw do
  root 'pages#home'

  resources :subjects
  resources :courses
end
