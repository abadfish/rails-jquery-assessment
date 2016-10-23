Rails.application.routes.draw do
  resources :authors
  resources :posts
  root 'posts#index'
  get 'posts/:id/post_data', to: 'posts#post_data'

  get 'news_source', to: 'posts#get_news_source'

end
