Rails.application.routes.draw do
  mount Blogpost::Engine, :at => "blog"
end
