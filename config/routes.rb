Rails.application.routes.draw do
  devise_for :end_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get 'top' => 'admins#top'


  namespace :admins do
    resources :admins,:items
  end

  namespace :users do
    resources :end_users,:items
  end
  get 'admins' => 'admins/admins#top'
  get 'items/top' => 'admins/items#top'
  get '/admin/:id/edit/password' => 'admins/admins#edit_password'
  get '/item' => 'users/items#index'
  get 'users/:id' => 'users/end_users#mypage', as: 'mypage'
  get 'users/:id/quit' => 'users/end_users#quit'
end
