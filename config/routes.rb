Rails.application.routes.draw do
  get 'users/show'
  get 'users/authenticate'
  get 'callbacks/new'
  root 'users#show'
end
