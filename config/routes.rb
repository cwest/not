Rails.application.routes.draw do
  mount Peek::Railtie => '/peek' if PeekBar.available?

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

    resource :register, controller: 'devise/registrations', except: :show do
      member do
        get 'cancel'
      end
    end

    resources :organizations

    root to: 'static#index'
  end
end
