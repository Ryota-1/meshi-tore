Rails.application.routes.draw do

  root 'homes#top'
  get 'homes/top' => 'homes#top'
  get 'homes/about' => 'homes#about'

  devise_for :admins, controllers: {
  	sessions: 'admins/sessions'
  }

  namespace :admins do
  	resources :genres
    resources :users
    resources :recipes
  end

  devise_for :users, controllers: {
  	sessions: 'users/sessions',
  	passwords: 'users/passwords',
    registrations: 'users/registrations',
  }

  namespace :users do
    resources :recipes do
      member do
        get :genre_recipes
      end
      resource :recipe_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    get "/:id/withdraw_confirm" => "users#withdraw_confirm", as: "withdraw_confirm"
    patch "/:id/withdraw" => "users#withdraw", as: "withdraw"
  end

  scope module: 'users' do
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
