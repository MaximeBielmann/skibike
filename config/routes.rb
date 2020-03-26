Rails.application.routes.draw do
  devise_for :users
  
  root 'pages#home'
  
  get 'admin' => 'pages#admin'
  get 'shop' => 'pages#shop'
  get 'booking' => 'pages#booking'
  get 'contact' => 'pages#contact'
  
  post 'mountains' => 'mountains#create'
  patch 'mountains/:id' => 'mountains#update'
  delete 'mountains/:id' => 'mountains#destroy'
  
  get 'schedules' => 'schedules#index'
  get 'schedules/:id' => 'schedules#show'
  
  post 'bookings' => 'bookings#create'
end
