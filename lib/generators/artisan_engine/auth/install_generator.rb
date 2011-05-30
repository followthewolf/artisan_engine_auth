require 'rails/generators/active_record'

module ArtisanEngine
  module Generators
    module Auth
      class InstallGenerator < ActiveRecord::Generators::Base

        argument    :name, :default => 'auth'
        source_root File.expand_path( '../templates', __FILE__ )

        def copy_installation_migration
          migration_template 'migrations/install_artisan_engine_auth.rb', 
                             'db/migrate/install_artisan_engine_auth.rb'
        end
        
      end
    end
  end
end