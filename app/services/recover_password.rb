class RecoverPassword

  attr_reader :flash

  def initialize(user, params)
    @user = user
    @params = params
    @expired = false
    @flash = nil
    @blank_password = false
    @success = false
  end

  def call
    if @user.password_reset_sent_at <= 2.hours.ago
      @expired = true
      @flash = 'This password reset request has expired. Please submit another request.'
      @user.erase_password_reset_fields
    elsif @params[:user][:password].blank?
      @user.errors.add(:password, "can't be blank")
      @blank_password = true
    elsif @user.update({ password: @params[:user][:password], password_confirmation: @params[:user][:password_confirmation] })
      @user.erase_password_reset_fields
      @success = true
      @flash = 'Your password was successfully changed. Please sign in.'
    end
    self
  end

  def success?
    @success
  end

  def expired?
    @expired
  end

  def blank_password?
    @blank_password
  end

end
