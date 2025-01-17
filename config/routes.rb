Rails.application.routes.draw do
  resources :movies, only: [:index, :show]
  resources :sheets, only: [:index, :new, :create, :edit, :update, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :admin do
    get 'schedules/index'
    get 'schedules/show'
    get 'schedules/edit'
    get 'schedules/update'
    get 'schedules/destroy'
    resources :movies, only: [:index, :new, :create, :edit, :update, :destroy] do
      resources :schedules, only: [:new]
    end
    resources :schedules, only: [:index, :show, :edit, :update, :destroy]
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

#Prefix                                    Verb                                                                                      URI                                                                                                Pattern                                                        Controller#Action
#movies_index                              GET                                                                                       /movies/index(.:format)                                                                            movies#index
#admin_movies                              GET                                                                                       /admin/movies(.:format)                                                                            admin/movies#index
#POST                                      /admin/movies(.:format)                                                                   admin/movies#create
#new_admin_movie                           GET                                                                                       /admin/movies/new(.:format)                                                                        admin/movies#new
#admin_movie                               PATCH                                                                                     /admin/movies/:id(.:format)                                                                        admin/movies#update
#PUT                                       /admin/movies/:id(.:format)                                                               admin/movies#update
#rails_health_check                        GET                                                                                       /up(.:format)                                                                                      rails/health#show
#turbo_recede_historical_location          GET                                                                                       /recede_historical_location(.:format)                                                              turbo/native/navigation#recede
#turbo_resume_historical_location          GET                                                                                       /resume_historical_location(.:format)                                                              turbo/native/navigation#resume
#turbo_refresh_historical_location         GET                                                                                       /refresh_historical_location(.:format)                                                             turbo/native/navigation#refresh
#rails_postmark_inbound_emails             POST                                                                                      /rails/action_mailbox/postmark/inbound_emails(.:format)                                            action_mailbox/ingresses/postmark/inbound_emails#create
#rails_relay_inbound_emails                POST                                                                                      /rails/action_mailbox/relay/inbound_emails(.:format)                                               action_mailbox/ingresses/relay/inbound_emails#create
#rails_sendgrid_inbound_emails             POST                                                                                      /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                            action_mailbox/ingresses/sendgrid/inbound_emails#create
#rails_mandrill_inbound_health_check       GET                                                                                       /rails/action_mailbox/mandrill/inbound_emails(.:format)                                            action_mailbox/ingresses/mandrill/inbound_emails#health_check
#rails_mandrill_inbound_emails             POST                                                                                      /rails/action_mailbox/mandrill/inbound_emails(.:format)                                            action_mailbox/ingresses/mandrill/inbound_emails#create
#rails_mailgun_inbound_emails              POST                                                                                      /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                                        action_mailbox/ingresses/mailgun/inbound_emails#create
#rails_conductor_inbound_emails            GET                                                                                       /rails/conductor/action_mailbox/inbound_emails(.:format)                                           rails/conductor/action_mailbox/inbound_emails#index
#POST                                      /rails/conductor/action_mailbox/inbound_emails(.:format)                                  rails/conductor/action_mailbox/inbound_emails#create
#new_rails_conductor_inbound_email         GET                                                                                       /rails/conductor/action_mailbox/inbound_emails/new(.:format)                                       rails/conductor/action_mailbox/inbound_emails#new
#rails_conductor_inbound_email             GET                                                                                       /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                       rails/conductor/action_mailbox/inbound_emails#show
#new_rails_conductor_inbound_email_source  GET                                                                                       /rails/conductor/action_mailbox/inbound_emails/sources/new(.:format)                               rails/conductor/action_mailbox/inbound_emails/sources#new
#rails_conductor_inbound_email_sources     POST                                                                                      /rails/conductor/action_mailbox/inbound_emails/sources(.:format)                                   rails/conductor/action_mailbox/inbound_emails/sources#create
#rails_conductor_inbound_email_reroute     POST                                                                                      /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                                rails/conductor/action_mailbox/reroutes#create
#rails_conductor_inbound_email_incinerate  POST                                                                                      /rails/conductor/action_mailbox/:inbound_email_id/incinerate(.:format)                             rails/conductor/action_mailbox/incinerates#create
#rails_service_blob                        GET                                                                                       /rails/active_storage/blobs/redirect/:signed_id/*filename(.:format)                                active_storage/blobs/redirect#show
#rails_service_blob_proxy                  GET                                                                                       /rails/active_storage/blobs/proxy/:signed_id/*filename(.:format)                                   active_storage/blobs/proxy#show
#GET                                       /rails/active_storage/blobs/:signed_id/*filename(.:format)                                active_storage/blobs/redirect#show
#rails_blob_representation                 GET                                                                                       /rails/active_storage/representations/redirect/:signed_blob_id/:variation_key/*filename(.:format)  active_storage/representations/redirect#show
#rails_blob_representation_proxy           GET                                                                                       /rails/active_storage/representations/proxy/:signed_blob_id/:variation_key/*filename(.:format)     active_storage/representations/proxy#show
#GET                                       /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format)  active_storage/representations/redirect#show
#rails_disk_service                        GET                                                                                       /rails/active_storage/disk/:encoded_key/*filename(.:format)                                        active_storage/disk#show
#update_rails_disk_service                 PUT                                                                                       /rails/active_storage/disk/:encoded_token(.:format)                                                active_storage/disk#update
#rails_direct_uploads                      POST                                                                                      /rails/active_storage/direct_uploads(.:format)                                                     active_storage/direct_uploads#create