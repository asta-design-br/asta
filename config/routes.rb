Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # Define custom routes for choosing user role and signing up as a producer or designer
  devise_scope :user do
    get '/sign_up_choice', to: 'registrations#sign_up_choice', as: :sign_up_choice
  end

  root to: 'pages#home'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  
  # Defines the root path route ("/")
  # root "articles#index"
end
