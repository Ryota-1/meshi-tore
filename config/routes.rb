Rails.application.routes.draw do

  root 'homes#top'
  get 'homes/top' => 'homes#top'
  devise_for :admins, controllers: {
  	sessions: 'admins/sessions'
  }

  namespace :admins do
  	resources :genres
  end

  devise_for :users, controllers: {
  	sessions: 'users/sessions',
  	passwords: 'users/passwords',
    registrations: 'users/registrations',
  }

  namespace :users do
    resources :recipes
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
