Rails.application.routes.draw do
  get 'places/create'
  get '/pins' => 'pins#index', :as => 'pins'
  get '/categories' => 'categories#index', :as => 'categories'
  get '/locations' => 'locations#index', :as => 'locations'
  get '/users' => 'users#index', :as => 'users'
  get '/lists' => 'lists#index', :as => 'lists'
  get '/all_lists' => 'lists#all_lists', :as => 'all_lists'
  post '/lists/create' => 'lists#create'
  post '/places/create' => 'places#create'
  post '/pins/create' => 'pins#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
