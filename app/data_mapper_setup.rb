env = ENV["RACK_ENV"] || "development"
#We're telling datamapper to use a postgres database on localhost. The name will be "bookmark_manager_test" or "bookmark_mamager_development" depending on the environment
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")


# After declaring your model, you should finalise them
DataMapper.finalize

# However, how the database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!