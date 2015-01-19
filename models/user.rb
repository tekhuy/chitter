require 'bcrypt'

class User

  include DataMapper::Resource

  has n, :peeps, :through => Resource

  property :id, Serial
  property :email, String, unique: true, message: "This email has already been registered"
  property :username, String, unique: true, message: "The username is unavailable"
  property :password_digest, Text
  property :password_token_timestamp, Time

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end