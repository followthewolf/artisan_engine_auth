Rails.application.routes.draw do
  devise_for :artisans, :skip => :registration
  
  # Add in registration routes manually, since Devise adds a bunch we don't need.
  devise_scope :artisan do
    get   'artisans/sign_up', :to => 'artisan_registrations#new', :as => 'new_artisan_registration'
    post  'artisans',         :to => 'devise/registrations#create'
  end
end