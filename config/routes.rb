Rails.application.routes.draw do
  mount Peek::Railtie           => 'peek' if PeekBar.available?
  mount LetterOpenerWeb::Engine => 'mail' if Rails.env.development?

  devise_for :user, skip: [:sessions, :passwords, :registrations, :unlocks]

  devise_scope :user do
    get  'login',  to: 'devise/sessions#new', as: 'new_login'
    post 'login',  to: 'devise/sessions#create'
    get  'logout', to: 'devise/sessions#destroy'

    scope :my do
      scope :account do
        resource :password, controller: 'devise/passwords', except: [:show, :destroy]
        resource :unlock,   controller: 'devise/unlocks',   only:   [:create, :new, :show]
      end
    end

    resource :join, controller: 'user_registrations', except: [:show, :new] do
      member do
        get 'cancel'
      end
    end
    get '/join', to: 'user_registrations#new', as: 'new_join'

    resources :organizations
  end

  mount JasmineRails::Engine => '/dev/specs' if defined?(JasmineRails)
end
