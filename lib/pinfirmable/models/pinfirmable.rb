module Devise
  module Models
    module Pinfirmable
      extend ActiveSupport::Concern
      included do
        before_create :generate_confirmation_token
      end

      protected

      def generate_confirmation_token
        pin = ""
        4.times { pin << SecureRandom.random_number(9).to_s }
        self.pinfirmable_pin = pin
      end
    end
  end
end
