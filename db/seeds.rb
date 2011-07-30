User.create(:email => 'demo@mail.com', :email_confirmation => 'demo@mail.com', :password => 'welcome', :password_confirmation => 'welcome') unless User.find_by_email('demo@mail.com')
