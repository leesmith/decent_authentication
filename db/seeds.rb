User.create(email: 'test@example.com', password: 'password', password_confirmation: 'password') unless User.find_by_email('test@example.com')

