Rails.application.routes.draw do
  resources :inscriptions do
    member do
      patch :estado
      patch :rechazar
      patch :aceptar
      
      
    end
  end
  resources :courses
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
  


      get "auth/login" => "users/sessions#new", as: "login"
      get "auth/registration" => "user/registrations#new", as: "register"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
