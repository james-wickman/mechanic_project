
                      Prefix Verb   URI Pattern                           Controller#Action
              calendars_show GET    /calendars/show(.:format)             calendars#show
                appointments GET    /appointments(.:format)               appointments#index
                             POST   /appointments(.:format)               appointments#create
             new_appointment GET    /appointments/new(.:format)           appointments#new
            edit_appointment GET    /appointments/:id/edit(.:format)      appointments#edit
                 appointment GET    /appointments/:id(.:format)           appointments#show
                             PATCH  /appointments/:id(.:format)           appointments#update
                             PUT    /appointments/:id(.:format)           appointments#update
                             DELETE /appointments/:id(.:format)           appointments#destroy
                 jobs_create POST   /jobs/create(.:format)                jobs#create
                   jobs_show GET    /jobs/show(.:format)                  jobs#show
                 jobs_update PUT    /jobs/update(.:format)                jobs#update
             vehicles_create POST   /vehicles/create(.:format)            vehicles#create
               vehicles_show GET    /vehicles/show(.:format)              vehicles#show
             vehicles_update PUT    /vehicles/update(.:format)            vehicles#update
             mechanics_index GET    /mechanics/index(.:format)            mechanics#index
              mechanics_show GET    /mechanics/show(.:format)             mechanics#show
                 users_index GET    /users/index(.:format)                users#index
                  users_show GET    /users/show(.:format)                 users#show
      home_unique_user_email GET    /home/unique_user_email(.:format)     home#unique_user_email
  home_unique_mechanic_email GET    /home/unique_mechanic_email(.:format) home#unique_mechanic_email
            vehicles_destroy DELETE /vehicles/destroy(.:format)           vehicles#destroy
                jobs_destroy DELETE /jobs/destroy(.:format)               jobs#destroy
        new_mechanic_session GET    /mechanics/sign_in(.:format)          mechanics/sessions#new
            mechanic_session POST   /mechanics/sign_in(.:format)          mechanics/sessions#create
    destroy_mechanic_session DELETE /mechanics/sign_out(.:format)         mechanics/sessions#destroy
       new_mechanic_password GET    /mechanics/password/new(.:format)     devise/passwords#new
      edit_mechanic_password GET    /mechanics/password/edit(.:format)    devise/passwords#edit
           mechanic_password PATCH  /mechanics/password(.:format)         devise/passwords#update
                             PUT    /mechanics/password(.:format)         devise/passwords#update
                             POST   /mechanics/password(.:format)         devise/passwords#create
cancel_mechanic_registration GET    /mechanics/cancel(.:format)           mechanics/registrations#cancel
   new_mechanic_registration GET    /mechanics/sign_up(.:format)          mechanics/registrations#new
  edit_mechanic_registration GET    /mechanics/edit(.:format)             mechanics/registrations#edit
       mechanic_registration PATCH  /mechanics(.:format)                  mechanics/registrations#update
                             PUT    /mechanics(.:format)                  mechanics/registrations#update
                             DELETE /mechanics(.:format)                  mechanics/registrations#destroy
                             POST   /mechanics(.:format)                  mechanics/registrations#create
            new_user_session GET    /users/sign_in(.:format)              users/sessions#new
                user_session POST   /users/sign_in(.:format)              users/sessions#create
        destroy_user_session DELETE /users/sign_out(.:format)             users/sessions#destroy
           new_user_password GET    /users/password/new(.:format)         devise/passwords#new
          edit_user_password GET    /users/password/edit(.:format)        devise/passwords#edit
               user_password PATCH  /users/password(.:format)             devise/passwords#update
                             PUT    /users/password(.:format)             devise/passwords#update
                             POST   /users/password(.:format)             devise/passwords#create
    cancel_user_registration GET    /users/cancel(.:format)               users/registrations#cancel
       new_user_registration GET    /users/sign_up(.:format)              users/registrations#new
      edit_user_registration GET    /users/edit(.:format)                 users/registrations#edit
           user_registration PATCH  /users(.:format)                      users/registrations#update
                             PUT    /users(.:format)                      users/registrations#update
                             DELETE /users(.:format)                      users/registrations#destroy
                             POST   /users(.:format)                      users/registrations#create
                        root GET    /                                     home#index

