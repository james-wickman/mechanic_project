Rails.application.routes.draw do
  put '/users/cancel_user_appointment'
  post '/mechanics/cancel_appointment'
  post '/users/contact_mechanics'
  post '/mechanics/contact_customers'
  get '/mechanics/view_jobs'
  get 'calendars/show'

  resources :appointments

  resources :jobs

  post 'vehicles/create'

  get 'vehicles/show'

  put 'vehicles/update'

  get 'mechanics/index'

  get 'mechanics/show'

  get 'users/index'

  get 'users/show'

  get 'home/unique_user_email'
  
  get 'home/unique_mechanic_email'

  delete 'vehicles/destroy'

  delete 'jobs/destroy'

	devise_for :mechanics, controllers: {
        sessions: 'mechanics/sessions',
        registrations: 'mechanics/registrations'
    }
	devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
    }
  # devise_for :mechanics
  # devise_for :users

	root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
