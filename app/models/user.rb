class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password

  before_create { generate_token(:auth_token) }

  validates_presence_of :password, on: :create
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, with: /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i, allow_blank: true

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
