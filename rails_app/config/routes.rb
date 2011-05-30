RailsApp::Application.routes.draw do
  devise_for :users
  resources :protected
  
  root :to => "devise/sessions#new"
  match "me" => "users#me"
end
