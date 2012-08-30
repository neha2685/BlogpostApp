Blogpost::Engine.routes.draw do
  resources :posts do
    resources :comments
  end

  get 'votes/:id/vote_up_post' => 'votes#vote_up_post', as: 'vote_up_post'
  get 'votes/:id/vote_up_comment' => 'votes#vote_up_comment', as: 'vote_up_comment'

  root :to => "posts#index"
end