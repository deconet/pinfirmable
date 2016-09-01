module Pinfirmable
  class Pin
    attr_accessor :digits

    def initialize(digits)
      @digits = digits.flatten.join
    end

    def matches_user_pin(user)
      user.pinfirmable_pin == @digits
    end
  end
end
