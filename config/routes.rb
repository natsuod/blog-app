Rails.application.routes.draw do
  get 'posts' => 'posts#index'
  get 'posts/new' => 'posts#new'
end
