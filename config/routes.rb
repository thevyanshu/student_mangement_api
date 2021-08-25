Rails.application.routes.draw do
  resources :details, :students, :departments, :teachers
  
  get 'profile/home'
  root to: 'profile#home'
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :departments do
        resources :students
      end
      
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
