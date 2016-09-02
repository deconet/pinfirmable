class PinfirmableMailer < ApplicationMailer
  def pin_email(user)
    mail(to: user.email, subject: "Confirmation code: #{user.pinfirmable_pin[0..2]}-#{user.pinfirmable_pin[3..6]}")
  end
end
