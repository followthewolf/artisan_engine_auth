require 'spec_helper'

describe ArtisanEngine::Auth do
  it "is an Engine" do
    ArtisanEngine::Auth::Engine.ancestors.should include Rails::Engine
  end

  it "initializes Devise" do
    Devise.should be_a Module
  end
  
  context "includes stylesheet expansions: " do
    context "artisan_engine: " do
      it "artisan_engine/auth/back" do
        ActionView::Helpers::AssetTagHelper.stylesheet_expansions[ :artisan_engine ]
        .should include "artisan_engine/auth/back"
      end
    end
  end
end

describe "ArtisanEngine::Auth Test/Development Environment" do
  it "initializes ArtisanEngine::Auth" do
    ArtisanEngine::Auth.should be_a Module
  end
  
  it "compiles its stylesheets into ArtisanEngine's stylesheets/artisan_engine/auth directory" do
    Compass.configuration.css_path.should == "#{ ArtisanEngine.root }/lib/generators/artisan_engine/templates/assets/stylesheets/artisan_engine/auth"
  end
  
  it "does not compile stylesheets during tests" do
    Sass::Plugin.options[ :never_update ].should be_true
  end
  
  it "compiles its javascripts into ArtisanEngine's javascripts/artisan_engine/auth directory" do
    Barista.output_root.should == Pathname.new( "#{ ArtisanEngine.root }/lib/generators/artisan_engine/templates/assets/javascripts/artisan_engine/auth" )
  end
end