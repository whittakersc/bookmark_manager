require 'spec_helper'

describe Link do
	
	context "Demonstration of how datamapper works" do

		# This is not a real test, it's simply a dmeo of how it works
		it 'should be created and then retrieved from the db' do
			expect(Link.count).to eq(0)
			Link.create(:title => "Makers Academy",
				:url => "http://www.makersacademy.com/")
			#we ask the database how many links we have, it should be 1 
			expect(Link.count).to eq(1)
			# Let's get the first (and only) link from the database
			link = Link.first
			# Now it has all properties that it was saved with.
			expect(link.url).to eq("http://www.makersacademy.com/")
			expect(link.title).to eq("Makers Academy")
			# If we want to, we can destroy it
			link.destroy 
			# so now we have no links in the database
			expect(Link.count).to eq(0)
		end
	end
end