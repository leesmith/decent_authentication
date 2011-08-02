class User < ActiveRecord::Base

  attr_accessible :email, :email_confirmation, :password, :password_confirmation

  attr_accessor :password

  # Callbacks
  before_create { generate_token(:auth_token) }
  before_save :encrypt_password

  # Validations
  validates_presence_of :email
  validates_presence_of :password, on: :create
  validates_confirmation_of :email, :password
  validates_presence_of :email_confirmation, :password_confirmation
  validates_uniqueness_of :email
  validates_format_of :email, with: /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i, allow_blank: true

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

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save(validate: false)
    UserMailer.password_reset(self).deliver
  end

end
