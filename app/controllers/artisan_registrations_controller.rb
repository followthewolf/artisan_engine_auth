class ArtisanRegistrationsController < Devise::RegistrationsController
  def new
    redirect_to root_path, :alert => 'Artisan registrations are closed.' and return if Artisan.any?
    
    # Implement the rest of Devise::RegistrationsController's :new action.
    # Modified to render the the artisans/registrations/new template.
    resource = build_resource({})
    respond_with_navigational(resource){ render 'artisans/registrations/new' }
  end
end