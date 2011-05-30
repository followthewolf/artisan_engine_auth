require 'artisan_engine/core'
require 'devise'
require 'artisan_engine/auth'

module ArtisanEngine
  module Auth

    # ------------------ Autoload Necessary Modules ------------------ #
    
    autoload :TestHelpers,               'artisan_engine/auth/test_helpers' if Rails.env.test?
    autoload :DeviseControllerExtension, 'artisan_engine/auth/devise_controller_extension'
    autoload :BackControllerExtension,   'artisan_engine/auth/back_controller_extension'
    
    # ------------------------- Vroom vroom! ------------------------- #
    
    class Engine < Rails::Engine
      config.before_configuration do
        ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion :artisan_engine => [ "artisan_engine/auth/back" ]
      end
      
      initializer 'initialize devise' do
        require 'artisan_engine/auth/initializers/devise'
      end
      
      config.to_prepare do        
        # Tell the Devise controllers to use different layouts.
        Devise::RegistrationsController.send :include, DeviseControllerExtension
        Devise::SessionsController.send :include, DeviseControllerExtension
        
        # Include the BackController extension.
        Manage::BackController.send :include, BackControllerExtension
      end
    end

  end
end