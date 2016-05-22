# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  email         :string
#  password_hash :string
#  password_salt :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'bcrypt'

class User < ActiveRecord::Base
  
  attr_accessor :password

  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  def self.authenticate(email, password)
    user = find_by_email(email)
    User.new.authenticate(user, email, password)
  end

  def authenticate(user, email, password)
    if user && user.password_hash == make_hash(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = make_hash(password, self.password_salt)
    end
  end

  def make_hash(p, s)
    BCrypt::Engine.hash_secret(p, s)
  end
end
