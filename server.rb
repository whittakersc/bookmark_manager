require 'data_mapper'
require 'sinatra'

env = ENV["RACK_ENV"] || "development"
#We're telling datamapper to use a postgres database on localhost. The name will be "bookmark_manager_test" or "bookmark_mamager_development" depending on the environment
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require_relative 'lib/link' # this needs to be done after datamapper is initialised

# After declaring your model, you should finalise them
DataMapper.finalize

# However, how the database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!

# gem install dm-postgres-adapter ==> Could not find PostgreSQL build environment (libraries & headers): 
# warning: Insecure world writable dir /usr/bin in PATH, mode 040777

get '/' do
	@links = Link.all
	erb :index
end

get '/links' do
	url = params["url"]
	title = params["title"]
	Link.create(:url => url, :title => title)
	redirect to('/')
end