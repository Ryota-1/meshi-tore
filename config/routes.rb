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
    get "/:id/withdraw_confirm" => "users#withdraw_confirm", as: "withdraw_confirm"
    patch "/:id/withdraw" => "users#withdraw", as: "withdraw"
  end

  scope module: 'users' do
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
