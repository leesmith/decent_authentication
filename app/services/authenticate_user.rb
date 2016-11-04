class AuthenticateUser

  attr_reader :flash

  def initialize(user, params)
    @user = user
    @params = params
    @authenticated = false
    @flash = nil
  end

  def call
    if @user && @user.authenticate(@params[:password]) && @user.enabled?
      @authenticated = true
      @flash = "Welcome back, #{@user.name}!"
    else
      @authenticated = false
      if @user.nil? || @user.enabled?
        @flash = 'The email or password you entered was not recognized. Please try again!'
      elsif !@user.enabled?
        @flash = 'Your account has been disabled!'
      end
    end
    self
  end

  def success?
    @authenticated
  end

end
