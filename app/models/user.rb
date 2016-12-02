
require 'bcrypt'


class User



include DataMapper::Resource

property :email, String
property :id, Serial
property :password_digest, Text


def password=(password)
  self.password_digest = BCrypt::Password.create(password)
end




end
