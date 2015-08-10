class AuthenticateUser

  def initialize(user, params)
    @user = user
    @params = params
    @result = false
  end

  def call
    if @user && @user.authenticate(@params[:password])
      @result = true
    else
      @result = false
    end
    self
  end

  def success?
    @result
  end

end
