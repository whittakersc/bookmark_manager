require 'data_mapper'
require './app/data_mapper_setup'

task :auto_upgrade do
	# auto_upgrade makes non-destructive changes.
	# If your tables don't excist, they will be created
	# but if they do and you changed you schema
	# (e.g. changd the type of one of the properties)
	# they will not be upgraded because that'd lead to data loss.
	DataMapper.auto_upgrade!
	puts "Auto-upgrade complete (no data loss)"
end

task :auto_migrate do 
	# to force the creation of all tables as they are 
	# described in your models, even if this 
	# leads to data loss, use auto_migrate:
	DataMapper.auto_migrate!
	puts "Auto-migrate complete (data was lost)"
end
# finally, don;t forget that before you do any of that stuff, 
# you need to create a databse first.
