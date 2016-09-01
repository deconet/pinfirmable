class PinfirmableMailer < ApplicationMailer
  def pin_email(user)
    mail(to: user.email, subject: "Confirmation code: #{user.pinfirmable_pin}")
  end
end
