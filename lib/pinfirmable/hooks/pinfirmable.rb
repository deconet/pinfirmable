Warden::Manager.after_set_user do |user, warden, _options|
  unless warden.env["CHECKING_PINFIRMABLE_PIN"] || !user.pinfirmable_pin.present?
    response = Rack::Response.new
    response.redirect "/users/confirmemail"
    throw :warden, response.finish
  end
end
