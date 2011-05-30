module ArtisanEngine
  module Auth
    module DeviseControllerExtension
      
      def self.included( controller )
        controller.send :include, ClassMethods
        controller.send :include, InstanceMethods
      end

      module ClassMethods
        def self.included( c )
          c.layout :layout_by_resource
        end
      end

      module InstanceMethods
        def layout_by_resource
          resource_name == :artisan ? "manage/back" : "front"
        end
      end
      
    end
  end
end