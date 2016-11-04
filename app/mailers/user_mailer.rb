class UserMailer < ApplicationMailer
  default from: '"Example" <noreply@example.com>'

  def password_reset(user)
    @user = user
    mail to: user.email, subject: 'Password Reset Request'
  end

end
