Rails.application.routes.draw do
  root 'requests#index'
  resources :requests
  resources :teachers
  resources :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
