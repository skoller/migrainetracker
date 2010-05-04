require 'digest'
class Patient < ActiveRecord::Base
  attr_accessor :password
  attr_accessible(:name, :email, :password, :password_confirmation)
  EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_confirmation_of :password
  validates_presence_of :password
  #validates_presence_of :password, :within 6..40
  validates_presence_of(:name, :email)
  validates_length_of :name, :maximum => 50
  validates_format_of :email, :with => EmailRegex
  validates_uniqueness_of :email, :case_sensitive => false
  before_save :encrypt_password
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  def remember_me!
    self.remember_token = encrypt("#{salt}--#{id}")
    save_without_validation
  end
  def self.authenticate(email,submitted_password)
    patient = find_by_email(email)
    return nil  if patient.nil?
    return patient if patient.has_password?(submitted_password)
  end
  has_many :headaches
  private
  
  def encrypt_password
    unless password.nil?
      self.salt = make_salt
      self.encrypted_password = encrypt(self.password)
    end
  end
  def encrypt(string)
    secure_hash("#{salt}#{string}")
  end
  def make_salt
    secure_hash("#{Time.now.utc}#{password}")
  end
  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
end
