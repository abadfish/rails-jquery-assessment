Rails.application.routes.draw do
  resources :comments
  resources :authors
  resources :posts
  root 'posts#index'
  get 'posts/:id/post_data', to: 'posts#post_data'
  get 'authors/:id/author_data', to: 'authors#author_data'

  get 'news_source', to: 'posts#get_news_source'

end
