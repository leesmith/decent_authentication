Fabricator(:user) do
  email { sequence(:email) { |i| "user#{i}@mail.com" } }
  email_confirmation { |u| u.email }
  password 'password'
  password_confirmation 'password'
end
