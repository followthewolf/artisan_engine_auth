require File.expand_path( '../acceptance_helper', __FILE__ )

feature "Protect Back-End", %q{
  In order to protect my back-end from unsavory characters
  As an artisan
  I want to be required to log in to access an administration page.
} do
  
  background do
    # Given I have created an Artisan account,
    create_artisan_account :email    => 'artisan@example.com',
                           :password => 'artisan'
                           
    # And I am signed out,
    visit '/artisans/sign_out'
  end
  
  scenario "I am prompted to log in when accessing an administration page" do
    # When I visit an administration page,
    visit '/manage'
    
    # Then I should be prompted to sign in.
    page.current_path.should == '/artisans/sign_in'
    
    # When I sign in with valid information,
    fill_in 'E-Mail',   :with => 'artisan@example.com'
    fill_in 'Password', :with => 'artisan'
    
    click_button 'Sign In'
    
    # Then I should be on the page I requested.
    page.current_path.should == '/manage'
  end
end