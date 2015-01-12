Rails.application.routes.draw do
  root 'top#index'
  devise_for :users

  get '/about' => 'about#index'
  get '/contact' => 'contact#index'
  resources   :events
  get '/event/info' => 'events#info'
  resources   :people
  delete 'people/:id/keywords' => 'people#delete_keywords'
  resources   :resources
  delete 'resources/:id/keywords' => 'resources#delete_keywords'
  get '/admin' => 'admin#index'
  resources   :comments
end
