module Devise
  class PinfirmableController < DeviseController
    def new
      request.env["CHECKING_PINFIRMABLE_PIN"] = true
      @locked_out = locked_out?
      request.env["CHECKING_PINFIRMABLE_PIN"] = false
    end

    def create
      request.env["CHECKING_PINFIRMABLE_PIN"] = true
      if locked_out?
        @locked_out = true
        render(:new, status: 429) && return
      end

      if Pinfirmable::Pin.new(params[:digits]).matches_user_pin(pinfirmable_user)
        pinfirmable_user.update_attribute(:pinfirmable_pin, nil)
        redirect_to after_confirmation_path_for(resource_name, pinfirmable_user)
      else
        tries = pinfirmable_user.pinfirmable_tries += 1
        lockout = (tries % 3).zero? ? (tries / 3).minute.from_now : nil
        pinfirmable_user.update_attributes(
          pinfirmable_tries: tries,
          pinfirmable_lockout: lockout
        )
        @locked_out = locked_out?
        redirect_to user_confirmemail_path
      end
      request.env["CHECKING_PINFIRMABLE_PIN"] = false
    end

    def resend_email
      flash[:notice] = "We have just resent your code"
      PinfirmableMailer.pin_email(pinfirmable_user).deliver
      redirect_to user_confirmemail_path
    end

    protected

    def pinfirmable_user
      request.env["CHECKING_PINFIRMABLE_PIN"] = true
      pu = current_user
      request.env["CHECKING_PINFIRMABLE_PIN"] = false
      pu
    end

    def locked_out?
      return false unless pinfirmable_user
      return false if pinfirmable_user.pinfirmable_lockout.nil?
      pinfirmable_user.pinfirmable_lockout > Time.now
    end

    def after_confirmation_path_for(resource_name, resource)
      if signed_in?(resource_name)
        signed_in_root_path(resource)
      else
        new_session_path(resource_name)
      end
    end
  end
end
