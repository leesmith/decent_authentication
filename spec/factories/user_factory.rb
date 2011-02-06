Factory.define :user do |user|
  user.sequence(:email) {|n| "user#{n}@examle.com"}
  user.email_confirmation {|u| u.email }
  user.password "password"
  user.password_confirmation "password"
end
