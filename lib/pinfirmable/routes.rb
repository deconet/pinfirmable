module ActionDispatch
  module Routing
    class Mapper
      protected

      def devise_pinfirmable(mapping, controllers)
        resource :pinfirmable,
                 only: [:create],
                 path: mapping.path_names[:pinfirmable],
                 controller: controllers[:pinfirmable] do
                   post :resend_email
                 end

        get :confirmemail, to: :new, controller: controllers[:pinfirmable], action: :new
      end
    end
  end
end
