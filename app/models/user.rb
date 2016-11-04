class User < ApplicationRecord
  attr_accessor :skip_password_validation

  validates :name, :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  validates_format_of :email, with: /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  validates_presence_of :password, unless: Proc.new { |u| u.skip_password_validation? }
  validates_length_of :password, minimum: 8, too_short: 'must be at least 8 characters',
    unless: Proc.new { |u| u.skip_password_validation? }
  validates_format_of :password, with: /\A(?=.*[a-z])(?=.*\d).+\z/i,
    message: 'must be alphanumeric',
    unless: Proc.new { |u| u.skip_password_validation? }

  before_save { |user| user.email.downcase! }

  has_secure_password
  has_secure_token :auth_token
  has_secure_token :password_reset_token

  def skip_password_validation?
    skip_password_validation
  end

end
