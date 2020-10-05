Rails.application.routes.draw do

     devise_for :users, contorollers: {
       sessions: 'users/sessions',registrations: 'user/registration'
     }

       resources :users, only: [:show, :index, :update, :edit]
       resources :books, only: [:create, :index, :show, :update, :edit, :destroy]
     root 'home#top'
  get 'home/about'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end