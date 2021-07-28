class User < ActiveRecord::Base
  has_secure_password
  attr_accessor :password_confirmation
  validates :first_name, presence: true, length: { minimum: 3 }
  validates :last_name, presence: true, length: { minimum: 3 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 5 }


  def self.authenticate_with_credentials(email, password)
    email = email.downcase.strip
    @user = User.find_by_email(email)
    
    puts email
    if @user && @user.password == password
      @user
    else
      nil
    end
  end
end
