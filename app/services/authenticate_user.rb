class AuthenticateUser

  def self.call(user, params)
    if user && user.authenticate(params[:password])
      true
    else
      false
    end
  end

end
