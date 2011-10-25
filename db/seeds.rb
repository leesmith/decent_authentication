User.create(email: 'test@mail.com', password: 'test', password_confirmation: 'test') unless User.find_by_email('test@mail.com')
