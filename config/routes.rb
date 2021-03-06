Rails.application.routes.draw do
  get 'places/create'
  get '/pins' => 'pins#index', :as => 'pins'
  get '/categories' => 'categories#index', :as => 'categories'
  get '/locations' => 'locations#index', :as => 'locations'
  get '/locations_filter' => 'locations#locations_filter', :as => 'locations_filter'
  get '/users' => 'users#index', :as => 'users'
  get '/lists' => 'lists#index', :as => 'lists'
  get '/all_lists' => 'lists#all_lists', :as => 'all_lists'
  get '/lists/:id/user_lists' => 'lists#user_lists', :as => 'user_lists'
  post '/lists/create' => 'lists#create'
  patch '/lists/:id/remove_author' => 'lists#remove_author'
  post '/places/create' => 'places#create'
  post '/pins/create' => 'pins#create'
  patch '/lists/:id/edit' => 'lists#edit'
  delete 'pins/:id/delete', :to => 'pins#delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
