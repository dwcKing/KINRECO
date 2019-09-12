Rails.application.routes.draw do
  devise_for :end_users
  resources:items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
get 'top' => 'admins#top'
get 'mypage' => 'end_users#mypage'
get 'quit' => 'end_users#quit'
end
