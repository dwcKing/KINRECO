Rails.application.routes.draw do
  devise_for :end_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top' => 'admins#top'
  root 'admins#index'
  resources :admins
  resources :end_users
  get 'items/top' => 'items#top'
  get '/admin/:id/edit/password' => 'admins#edit_password'
end
