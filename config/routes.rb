Mainapp::Application.routes.draw do
  devise_for :users, :controllers => { :sessions => :sessions }
  mount Blogpost::Engine, :at => "blog"
  root :to => "welcome#index"
end
