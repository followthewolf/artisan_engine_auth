require File.expand_path( File.dirname( __FILE__ ) + '/../acceptance_helper' )

feature "Sign into an artisan account", %q{
  In order to resume my ArtisanEngine experience
  As an artisan
  I want to sign in to my artisan account.
} do
  
  background do
    # Given I have created an artisan account
    create_artisan_account :email    => 'me@myself.com',
                           :password => 'myselfandi'
                           
    # And I am signed out
    visit '/artisans/sign_out'
    
    # And I am on the sign in page
    visit '/artisans/sign_in'
  end
  
  scenario "I can sign in to my account with valid information" do
    # When I fill in valid credentials and click Sign In
    fill_in 'E-Mail',   :with => 'me@myself.com'
    fill_in 'Password', :with => 'myselfandi'
    click_button 'Sign In'
    
    # Then I should be signed in
    page.should have_content 'Signed In'
  end
  
  scenario "I cannot sign in to my account with invalid information" do
    # When I fill in invalid credentials and click Sign In
    fill_in 'E-Mail',   :with => 'me@myself.com'
    fill_in 'Password', :with => 'invalid'
    click_button 'Sign In'
    
    # Then I should see an alert,
    page.should have_selector '.alert'
    
    # And I should not be signed in.
    page.should have_content 'Signed Out'
  end
end