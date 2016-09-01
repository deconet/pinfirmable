module ActionDispatch
  module Routing
    class Mapper
      protected

      def devise_pinfirmable(mapping, controllers)
        resource :pinfirmable,
                 only: [:new, :create],
                 path: mapping.path_names[:pinfirmable],
                 controller: controllers[:pinfirmable]
      end
    end
  end
end
