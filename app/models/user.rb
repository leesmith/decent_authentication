class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :password, on: :create
  validates_confirmation_of :password
  validates_presence_of :email, :password_confirmation
  validates_uniqueness_of :email
  validates_format_of :email, with: /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i, allow_blank: true
end
