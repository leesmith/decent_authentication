class User < ApplicationRecord

  validates :name, :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  validates_format_of :email, with: /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  validates_length_of :password, minimum: 8, too_short: 'must be at least 8 characters', allow_nil: true
  validates_format_of :password, with: /\A(?=.*[a-z])(?=.*\d).+\z/i, message: 'must be alphanumeric', allow_nil: true

  before_save { |user| user.email.downcase! }

  has_secure_password
  has_secure_token :auth_token
  has_secure_token :password_reset_token

  def erase_password_reset_fields
    self.update(password_reset_token: nil, password_reset_sent_at: nil)
  end

end
