Rails.application.routes.draw do
  resources :tags, except: :show
  get 'tags/:tag', to: 'story#index'
  concern :taggable do
	  resources :tags, only: [:new, :index, :create]
	end
  resources :users, only: [:show, :index, :new_member, :remove_member, :destroy]
  resources :story
  get 'resourceshome/index'
  get "new_member" => 'users#new_member', :as => :new_member
  get "remove_member" => 'users#remove_member', :as => :remove_member
  get "add_tags" => 'story#add_tags', :as => :add_tags
  #post 'new_user_invitation' => 'users_invitations#invite_resource', as: :new_user_invitation


  root to: "home#index"

    devise_for :users, skip: [:sessions, :registrations, :passwords]

	devise_scope :user do
	  # sessions
	  get    'sign_in',  to: 'devise/sessions#new',     as: :new_user_session
	  post   'login',  to: 'users/sessions#create',  as: :user_session
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
	  #invitations
	  get 'new_user_invitation', to: 'devise/invitations#new'
	  post '/users/invitation/new', to: 'users_invitations#invite_resource', as: :invite
	  post '/users/invitation/accept', to: 'users_invitations#accept_resource', as: :accept
	end

end
 