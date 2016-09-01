require "pinfirmable/engine"
require "devise"

module Pinfirmable
end

Devise.add_module :pinfirmable,
                  controller: :pinfirmable,
                  route: :pinfirmable,
                  model: "pinfirmable/models/pinfirmable"

require "pinfirmable/routes"
require "pinfirmable/pin"
require "pinfirmable/hooks/pinfirmable"
