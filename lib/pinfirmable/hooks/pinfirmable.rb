Warden::Manager.after_set_user do |user, proxy, opts|
  #TODO: Only redirect if the users pin is still present
  response = Rack::Response.new
  response.redirect "/users/pinfirmable/new"
  throw :warden, response.finish
end
