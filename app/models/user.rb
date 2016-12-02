
require 'bcrypt'


class User



include DataMapper::Resource

property :email, String, :required => true, :format => :email_address
property :id, Serial
property :password_digest, Text


def password=(password)
  self.password_digest = BCrypt::Password.create(password)
end




end
