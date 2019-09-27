Rails.application.routes.draw do
  resources :users, only: [:show, :index]
  get 'resourceshome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  #devise_for :users, controllers: { sessions: 'users/sessions' , registrations: 'users/registrations'}
  #devise_for :users, :controllers => {:registrations => "registrations"}
 
    devise_for :users, skip: [:sessions, :registrations, :passwords]

	devise_scope :user do
	  # sessions
	  get    'sign_in',  to: 'devise/sessions#new',     as: :new_user_session
	  post   'login',  to: 'devise/sessions#create',  as: :user_session
	  delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
	  # registrations
	  put    '/account',  to: 'devise/registrations#update'
	  delete '/account',  to: 'devise/registrations#destroy'
	  post   '/account',  to: 'users/registrations#create'
	  get    '/register', to: 'devise/registrations#new',    as: :new_user_registration
	  get    '/account',  to: 'devise/registrations#edit',   as: :edit_user_registration
	  patch  '/account',  to: 'devise/registrations#update', as: :user_registration
	  get    '/account/cancel', to: 'devise/registrations#cancel', as: :cancel_user_registration# passwords 
	  # passwords
	  get   'new-pass',  to: 'devise/passwords#new',    as: :new_user_password
	  get   'edit-pass', to: 'devise/passwords#edit',   as: :edit_user_password
	end

end
