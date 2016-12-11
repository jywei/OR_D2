Blog::Application.routes.draw do
  resources :posts

  # match '/sinatra' => MySinatraApp, anchor: false
  # mount MySinatraApp, at: '/', anchor: false
  root to: 'posts#index'
end
