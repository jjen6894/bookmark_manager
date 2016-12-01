require 'data_mapper'
require 'dm-postgres-adapter'

<<<<<<< HEAD


class Link
  include DataMapper::Resource


  property :id, Serial
  property :title, String
  property :url, String

=======
class Link

	include DataMapper::Resource

	property :id, Serial
	property :url, String
	property :title, String
>>>>>>> 4626aced131728abeab039cf87d469d9c5afe780

end

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_test")
<<<<<<< HEAD
DataMapper.finalize
DataMapper.auto_upgrade!
=======

DataMapper.finalize

DataMapper.auto_upgrade!
>>>>>>> 4626aced131728abeab039cf87d469d9c5afe780
