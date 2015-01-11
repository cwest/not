Rails.application.routes.draw do
  mount Peek::Railtie => '/peek' if PeekBar.available?
  devise_for :users
  root to: 'static#index'

  resources :organizations
end
