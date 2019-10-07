require 'securerandom'

class User

  include Mongoid::Document
  include Mongoid::Timestamps

  attr_accessor :password
  before_save :encrypt_password
  before_create :generate_confirmation_token

  # Personal Details
  field :name, type: String
  field :email, type: String

  # Security
  field :encrypted_password, type: String
  field :password_salt, type: String  
  field :confirmation_token, type: String
  field :email_confirmed, type: Boolean, default: false 


  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    if user && user.encrypted_password == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def generate_confirmation_token
    self.confirmation_token = SecureRandom.hex
  end
end
