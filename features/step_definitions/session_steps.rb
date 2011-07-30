Given 'I am signed in' do
  @me = Factory(:user)
  When %(I go to the sign in page)
  When %(I fill in "Email" with "#{@me.email}")
  When %(I fill in "Password" with "#{@me.password}")
  When %(I press "Sign in")
end

Given 'I am signed in with the remember me option' do
  @me = Factory(:user)
  When %(I go to the sign in page)
  When %(I fill in "Email" with "#{@me.email}")
  When %(I fill in "Password" with "#{@me.password}")
  When %(I check "Remember me")
  When %(I press "Sign in")
end
