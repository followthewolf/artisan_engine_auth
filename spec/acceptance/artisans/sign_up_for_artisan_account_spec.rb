require File.expand_path( File.dirname( __FILE__ ) + '/../acceptance_helper' )

feature "Sign up for an artisan account", %q{
  In order to begin my ArtisanEngine experience
  As an artisan
  I want to sign up for my artisan account.
} do
  
  background do
    # Given I am on the artisan sign up page,
    visit '/artisans/sign_up'
  end

  scenario "I can sign up for an artisan account with valid information" do
    # When I fill in valid information and click Create Artisan Account,
    create_artisan_account
    
    # Then I should be on the home page,
    page.current_path.should == '/'
    
    # And I should be signed in.
    page.should have_content 'Signed In'
  end
  
  scenario "I cannot sign up for an artisan account with invalid information" do
    # When I fill in invalid information and click Create Artisan Account,
    fill_in 'First Name',       :with => 'Ambrose'
    fill_in 'Last Name',        :with => ''
    fill_in 'E-Mail',           :with => 'i@cant.be.bothered'
    fill_in 'Password',         :with => ''
    fill_in 'Confirm Password', :with => 'spite'
    
    click_button 'Create Artisan Account'
    
    # Then I should see an alert,
    page.should have_selector '.alert'
    
    # And I should not be signed in.
    page.should have_content 'Signed Out'
  end

end