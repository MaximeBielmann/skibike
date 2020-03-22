Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  get 'admin' => 'pages#admin'
  get 'shop' => 'pages#shop'
  get 'booking' => 'pages#booking'
  get 'contact' => 'pages#contact'
end
