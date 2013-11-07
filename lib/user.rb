require 'bcrypt'

class User

	include DataMapper::Resource

	property :id, Serial
	property :email, String
	# this will store both the password and the salt
	# It's Text and not String because Strings holds 50 character by default
	# and it's not enough for the hash and salt
	property :password_digest, Text

	attr_reader :password
	attr_accessor :password_confirmation

	# this is datamapper's mathod of validating the model.
	# The model will not be saved unless both password
	# and password_confirmationare the same
	# read more about it in the documentation 
	# http://datamapper.org/docs/validations.html
	validates_confirmation_of :password

	# when assigned the password, we don't store it directly 
	# instead, we generate a password digest, that looks like this:
	# "$2a$10$vI8aWBnW3FID.ZQ4/zo1G.q11Rps.9cGLcZEiGDMv5yUP1KUOYTa"
	# and save it in the database. This digest, provided by bcrypt, 
	# has both the password hash and salt. We save it to the 
	# database instead of the plain password for security reasons.

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

end