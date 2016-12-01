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

	has n, :tags, :through => Resource

	property :id, Serial
	property :url, String
	property :title, String
>>>>>>> 4626aced131728abeab039cf87d469d9c5afe780

end

<<<<<<< HEAD
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_test")
<<<<<<< HEAD
DataMapper.finalize
DataMapper.auto_upgrade!
=======

DataMapper.finalize

DataMapper.auto_upgrade!
>>>>>>> 4626aced131728abeab039cf87d469d9c5afe780
=======
>>>>>>> a4fe51161571681599ba32c9a6e43982410f5a6b
