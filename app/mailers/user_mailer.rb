class UserMailer < ActionMailer::Base
  default from: 'no-reply@example.com'

  def password_reset(user)
    @user = user
    mail to: user.email, subject: t(:reset_password)
  end
end
