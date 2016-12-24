class SendPasswordResetRequest

  def initialize(user)
    @user = user
  end

  def call
    # generate a new auth token
    @user.regenerate_password_reset_token
    # update the password reset sent_at
    @user.touch(:password_reset_sent_at)
    # deliver the email
    UserMailer.password_reset(@user).deliver_now
  end

end
