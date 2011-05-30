module ArtisanEngine
  module Auth
    module BackControllerExtension
      
      def self.included( controller )
        controller.send :include, ClassMethods
      end

      module ClassMethods
        def self.included( c )
          c.before_filter :authenticate_artisan!
        end
      end
      
    end
  end
end