require "pinfirmable/engine"
require "devise"

module Pinfirmable
end

Devise.add_module :pinfirmable,
                  controller: :pinfirmable,
                  route: :pinfirmable

require "pinfirmable/routes"
require "pinfirmable/hooks/pinfirmable"
