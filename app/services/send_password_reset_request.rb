class SendPasswordResetRequest

  def initialize(user)
    @user = user
  end

  def call
    # disable password requirement
    @user.skip_password_validation = true
    # generate a new auth token
    @user.regenerate_password_reset_token
    # update the password reset sent_at
    @user.password_reset_sent_at = Time.current
    # save this user
    @user.save(validate: false)
    # deliver the email
    UserMailer.password_reset(@user).deliver_now
  end

end
