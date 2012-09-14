class FoodTruckController < ApplicationController
	
	def index
		puts 'in index method of the FoodTruckController'

		venue = Foursquare::Venue.new(params[:accessToken])
		
		#rawMovingTargets = venue.search({:ll => "40.7619,-73.9763",:categoryId => "4f2a23984b9023bd5841ed2c",:intent => "browse", :radius => "100000"})
		#rawMovingTargets = venue.search({:ll => "40.7619,-73.9763",:categoryId => "4f2a23984b9023bd5841ed2c"})
		rawMovingTargets = venue.search({:near => "Manhattan", :categoryId => "4f2a23984b9023bd5841ed2c"})

		@filtered = filterResults(rawMovingTargets["response"]["venues"])
		render :json => @filtered

	end

	def filterResults(results)
		puts 'filtering results...'
		filtered = []
		results.each do |venue|

			categories = venue["categories"]
			categories.each do |category|
				categoryName = category['name'].to_s
				if (categoryName.include? "food" or categoryName.include? "Food")
					puts 'name: ' + venue["name"]
					puts 'category name**: ' + categoryName
					puts ''
					filtered.append(venue)
				end
			end
		end
		return filtered
	end	
end


