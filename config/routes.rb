Rails.application.routes.draw do
  resources :charges, only: %i[new create]
  resources "contacts", only: [:new, :create]
  
  devise_for :users
  
  root 'pages#home'
  
  get 'admin' => 'pages#admin'
  get 'shop' => 'pages#shop'
  get 'booking' => 'pages#booking'
  get 'contact' => 'contacts#new'
  
  post 'mountains' => 'mountains#create'
  patch 'mountains/:id' => 'mountains#update'
  delete 'mountains/:id' => 'mountains#destroy'
  
  get 'schedules' => 'schedules#index'
  get 'schedules/:id' => 'schedules#show'
  
  get 'bookings/:id' => 'bookings#show'
  post 'bookings' => 'bookings#create'
  delete 'bookings/:id' => 'bookings#destroy'
  get 'bookings/:id/payement' => 'charges#new'
end
