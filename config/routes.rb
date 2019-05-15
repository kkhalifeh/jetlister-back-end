Rails.application.routes.draw do
  get '/categories' => 'categories#index', :as => 'categories'
  get '/locations' => 'locations#index', :as => 'locations'
  get '/users' => 'users#index', :as => 'users'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
