class User < ActiveRecord::Base
  has_many :surveysD

  validates :password, :length => { :minimum => 1 }

  validates :password, :length => { :minimum => 1 }
  validates :email, :uniqueness => true, :format => /.+@.+\..+/ # imperfect, but okay

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @password = pass
    @password = Password.create(pass)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return user if user && (user.password == password)
    nil # either invalid email or wrong password
  end
  
end
