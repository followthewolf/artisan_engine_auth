require 'spec_helper'
require 'steak'

# ---------------------- Load Support Files ---------------------- #

include ArtisanEngine::Auth::TestHelpers::Integration

Dir[ "#{ File.dirname( __FILE__ ) }/support/**/*.rb" ].each { |f| require f }