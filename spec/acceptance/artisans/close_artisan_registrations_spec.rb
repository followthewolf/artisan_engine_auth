require File.expand_path( File.dirname( __FILE__ ) + '/../acceptance_helper' )

feature "Close artisan registration after artisan registers", %q{
  In order to protect the site from unauthorized artisan registrations
  As an artisan
  I want new artisan registrations to be closed after I register.
} do
  
  background do
    # Given I have created an artisan account
    create_artisan_account
    
    # And I have signed out
    visit '/artisans/sign_out'
  end
  
  scenario "I cannot register a new artisan account if an artisan is registered" do
    # When I attempt to register another artisan account
    visit '/artisans/sign_up'
    
    # Then I should be on the home page,
    page.current_path.should == '/'
    
    # And I should see an alert.
    page.should have_selector '.alert', :text => 'Artisan registrations are closed.'
  end
end