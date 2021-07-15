Rails.application.routes.draw do
  resources :details, :students, :departments, :teachers
  
  get 'profile/home'
  root to: 'profile#home'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
