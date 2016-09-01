class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    render plain: "Hello world!"
  end
end
