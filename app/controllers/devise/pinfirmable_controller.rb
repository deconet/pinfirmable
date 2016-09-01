module Devise
  class PinfirmableController < DeviseController
    def new
    end

    def create
      request.env["CHECKING_PINFIRMABLE_PIN"] = true
      if Pinfirmable::Pin.new(params[:digits]).matches_user_pin(current_user)
        current_user.update_attribute(:pinfirmable_pin, nil)
        redirect_to after_confirmation_path_for(resource_name, current_user)
      else
        redirect_to new_user_pinfirmable_path
      end
      request.env["CHECKING_PINFIRMABLE_PIN"] = false
    end

    protected

    def after_confirmation_path_for(resource_name, resource)
      if signed_in?(resource_name)
        signed_in_root_path(resource)
      else
        new_session_path(resource_name)
      end
    end
  end
end
