Rails.application.routes.draw do
  root "application#index"
  devise_for :users
  mount Pinfirmable::Engine => "/pinfirmable"
end
