SmRc181::Application.routes.draw do
  resources :comments


  resources :users


  root :to => 'comments#index'

end
