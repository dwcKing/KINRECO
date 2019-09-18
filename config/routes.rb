Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'top' => 'admins#top'


  devise_for :admins, controllers: {
  unlocks: 'admins/unlocks',
  omniauth: 'admins/omniauth',
  registrations: 'admins/registrations',
  passwords: 'admins/passwords',
  confirmations: 'admins/confirmations',
  sessions: 'admins/sessions',
  }
  devise_for :end_users, controllers: {
  unlocks: 'end_users/unlocks',
  omniauth: 'end_users/omniauth',
  registrations: 'end_users/registrations',
  passwords: 'end_users/passwords',
  confirmations: 'end_users/confirmations',
  sessions: 'end_users/sessions',
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admins do
    resources :admins
    resources :items do
        resources :arrivals
    end
  end

  namespace :users do
    resources :end_users,:items
  end

  get 'admins' => 'admins/admins#top'
  get 'items/top' => 'users/items#top'
  get '/admin/:id/edit/password' => 'admins/admins#edit_password'
  get '/item' => 'users/items#index'

  get 'users/:id' => 'users/end_users#mypage', as: 'mypage'
  get 'users/:id/quit' => 'users/end_users#quit'
  get 'mypage' => 'end_users#mypage'
  get 'quit' => 'end_users#quit'
  # get 'end_users/:id/edit' => 'end_users#edit'

end
