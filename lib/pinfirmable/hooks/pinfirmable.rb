Warden::Manager.after_set_user do |user, warden, options|
  unless warden.env["CHECKING_PINFIRMABLE_PIN"] || !user.pinfirmable_pin.present?
    response = Rack::Response.new
    response.redirect "/users/pinfirmable/new"
    throw :warden, response.finish
  end
end
