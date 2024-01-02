class User < ApplicationRecord
  has_secure_password

  validates :email, 
    uniqueness: true, 
    length: { in: 3..255 }, 
    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :session_token, presence: true, uniqueness: true
  validates :password, length: { in: 6..255 }, allow_nil: true
  validates :last_name, presence: true
  validates :first_name, presence: true

  has_many :listings, foreign_key: :host_id
  has_many :reservations, foreign_key: 'guest_id'
  has_many :reviews, foreign_key: 'reviewer_id'
  
  before_validation :ensure_session_token

  def self.find_by_credentials(credential, password)
    # field = credential =~ URI::MailTo::EMAIL_REGEXP ? :email : :username
    user = User.find_by(:email => credential)
    user&.authenticate(password)
  end

  def reset_session_token!
    self.update!(session_token: generate_unique_session_token)
    self.session_token
  end

  private

  def generate_unique_session_token
    loop do
      token = SecureRandom.base64
      break token unless User.exists?(session_token: token)
    end
  end

  def ensure_session_token
    self.session_token ||= generate_unique_session_token
  end
end
