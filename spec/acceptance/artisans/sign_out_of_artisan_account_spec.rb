require File.expand_path( File.dirname( __FILE__ ) + '/../acceptance_helper' )

feature "Sign out of my artisan account", %q{
  In order to return to anonymity
  As an artisan
  I want to sign out of my artisan account.
} do
  
  background do
    # Given I have registered an artisan account and am signed in,
    create_artisan_account
  end
  
  scenario "I can sign out of my artisan account" do
    # When I visit the sign out path,
    visit '/artisans/sign_out'
    
    # Then I should be signed out.
    page.should have_content 'Signed Out'
  end
end