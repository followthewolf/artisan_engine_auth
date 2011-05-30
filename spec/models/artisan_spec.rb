require 'spec_helper'

describe Artisan do
  let( :new_artisan ) { Artisan.new :first_name            => 'Kvothe',
                                    :last_name             => 'the Bloodless',
                                    :email                 => 'k.arlidensson@university.org',
                                    :password              => 'felurian',
                                    :password_confirmation => 'felurian' }
  
  context "validations: " do
    it "is valid with valid attributes" do
      new_artisan.should be_valid
    end
  
    it "is not valid without a first name" do
      new_artisan.first_name = nil
      new_artisan.should_not be_valid
    end

    it "is not valid without a last name" do
      new_artisan.last_name = nil
      new_artisan.should_not be_valid
    end

    it "is not valid without an email" do
      new_artisan.email = nil
      new_artisan.should_not be_valid
    end
    
    it "is not valid with an incorrectly formatted email" do
      invalid_emails = [ "suckit", "nota@valid", "notavalid.email", "inv@ali*^d.net" ]

      for invalid_email in invalid_emails
        new_artisan.email = invalid_email
        new_artisan.should_not be_valid
      end
    end

    it "is not valid without a password" do
      new_artisan.password = nil
      new_artisan.should_not be_valid
    end
    
    it "is not valid with a password less than 6 or more than 128 characters long" do
      invalid_passwords = [ "short", "a" * 129 ]
      
      for invalid_password in invalid_passwords
        new_artisan.password              = invalid_password
        new_artisan.password_confirmation = invalid_password
        new_artisan.should_not be_valid
      end
    end

    it "is not valid without a matching password confirmation" do
      new_artisan.password_confirmation = 'unmatching'
      new_artisan.should_not be_valid
    end
  end
end
