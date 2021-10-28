class User < ApplicationRecord
  validates :username, :password_digest, :session_token, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  after_initialize :ensure_session_token

  has_many(
    :followers,
    class_name: 'Friendship',
    foreign_key: 'to_user',
  )

  has_many :followed, through: :followers
  

  has_many(
    :followed,
    class_name: 'Friendship',
    foreign_key: 'from_user'
  )

  has_many :followers, through: :followed

  has_many(
    :sent_messages,
    class_name: 'Message',
    foreign_key: :sender_id
  )

  has_many(
    :received_messages,
    class_name: 'Message',
    foreign_key: :receiver_id
  )

  attr_reader :password

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if user.nil?

    if user.is_password?(password)
      return user
    else
      return nil
    end
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def is_password?(password) 
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

end