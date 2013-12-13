PlanesApp::Application.routes.draw do

  resources :flights  
  root :to => "home#index"
end
