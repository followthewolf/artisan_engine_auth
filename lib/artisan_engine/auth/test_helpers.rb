module ArtisanEngine
  module Auth
    module TestHelpers
      module Integration
        def create_artisan_account( options = {} )
          visit '/artisans/sign_up'
          
          fill_in 'First Name',       :with => options[ :first_name ] || 'Kvothe'
          fill_in 'Last Name',        :with => options[ :last_name ]  || 'the Bloodless'
          fill_in 'E-Mail',           :with => options[ :email ]      || 'k.arlidensson@university.org'
          fill_in 'Password',         :with => options[ :password ]   || 'felurian'
          fill_in 'Confirm Password', :with => options[ :password ]   || 'felurian'

          click_button 'Create Artisan Account'
        end
        
        def sign_in_as_artisan( email, password )
          visit '/artisans/sign_in'
          
          fill_in 'E-Mail',   :with => email
          fill_in 'Password', :with => password
          
          click_button 'Sign In'
        end
      end
    end
  end
end