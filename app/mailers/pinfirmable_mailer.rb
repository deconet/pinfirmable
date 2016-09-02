class PinfirmableMailer < ApplicationMailer
  def pin_email(user)
    mail(
      to: user.email,
      subject: default_i18n_subject(
        code_part1: user.pinfirmable_pin[0..2],
        code_part2: user.pinfirmable_pin[3..6]
      )
    )
  end
end
