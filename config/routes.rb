Rails.application.routes.draw do
  root 'top#index'
  devise_for :users

  get '/about' => 'about#index'
  get '/contact' => 'contact#index'
  resources   :events
  get '/event/info' => 'events#info'
  resources   :people
  resources   :resources
  get '/admin' => 'admin#index'
  resources   :comments
end
