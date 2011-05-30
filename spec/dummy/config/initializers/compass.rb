require 'compass'

Sass::Plugin.options[ :never_update ] = true if Rails.env.test?

Compass.configuration.css_path = "#{ ArtisanEngine.root }/lib/generators/artisan_engine/templates/assets/stylesheets/artisan_engine/auth"
Compass.configuration.css_dir  = "#{ ArtisanEngine.root }/lib/generators/artisan_engine/templates/assets/stylesheets/artisan_engine/auth"
