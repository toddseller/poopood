class UserMailer < ApplicationMailer
  default from: 'Poo Pood <noreply@poopood.com>'

  def email_confirmation(user)
    @user = user

    mail(to: "#{user.email}", subject: "Please confirm your email")
  end
end
