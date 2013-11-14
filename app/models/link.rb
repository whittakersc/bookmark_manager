# This class corresponds to a table in the database
# We can use it to manipulate the data
class Link


	# this makes the instance of this class Datamapper resources
	include DataMapper::Resource

	has n, :tags, :through => Resource

	# This block describes what resource our model will have
	property :id, Serial # Serial mean that it will be auto-incrementedfor for every record
	property :title, String
	property :url, String

end