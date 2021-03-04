Rails.application.routes.draw do
  get "posts/index" => "posts#index"
  get "posts/index/:season" => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  post "posts/delete/:id" => "posts#delete"
  get "home/top" => "home#top"
  get "users/new" => "users#new"
  post "users/create" => "users#create"
  get "users/login_form" => "users#login_form"
  post "users/login" => "users#login"
  get "users/show/:id" => "users#show"
  post "users/logout" => "users#logout"
end
