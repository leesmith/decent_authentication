Fabricator(:user) do
  email { sequence(:email) { |i| "user#{i}@mail.com" } }
  password 'password'
  password_confirmation 'password'
end
