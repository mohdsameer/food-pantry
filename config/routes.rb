Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      get 'requests', to: 'users#connection_requests'
      post 'login', to: 'session#create'
      post 'signup', to: 'registration#create'
      post 'send_request', to: 'users#send_request'
      patch 'accept_request', to: 'users#accept_request'
      patch 'decline_request', to: 'users#decline_request'
    end
  end
  devise_for :users,
             controllers: { registrations: 'users/registrations', sessions: 'users/sessions', confirmations: 'users/confirmations',
                            passwords: 'users/passwords' }
  root "home#index"
end
