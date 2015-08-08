class User < ActiveRecord::Base

  attr_accessor :force_password_validation

  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  validates_format_of :email, with: /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i, allow_blank: true
  validates_presence_of :password, if: Proc.new { |u| u.force_password_validation? }

  before_create { generate_token(:auth_token) }
  before_save { |user| user.email.downcase! }

  has_secure_password

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save(validate: false)
    UserMailer.password_reset(self).deliver_now
  end

  def force_password_validation?
    force_password_validation
  end

end
