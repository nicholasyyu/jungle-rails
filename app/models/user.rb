class User < ActiveRecord::Base
	has_secure_password
	
	
  	EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  	validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  	validates :password, :confirmation => true, allow_nil: true#password_confirmation attr
  	validates_length_of :password, :in => 6..20, :on => :create
  
end
