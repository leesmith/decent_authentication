class User < ActiveRecord::Base

  attr_accessible :email, :email_confirmation, :password, :password_confirmation

  attr_accessor :password

  # Callbacks
  before_save :encrypt_password

  # Validations
  validates_presence_of :email
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password, :email
  validates_presence_of :password_confirmation, :email_confirmation
  validates_uniqueness_of :email
  validates_format_of :email, :with => /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end
