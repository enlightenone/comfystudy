class SearchesController < ApplicationController

    def index

      @keywords = params[:keywords].to_s
      @location = params[:location].to_s

      if @keywords.strip != ''

        @keywords + " study spot" 

      @location = "Los Angeles" unless @location.strip != ''
        @params = { 
           term: @keywords,
           limit: 10
         }
         @yelp_results = Yelp.client.search(@location, @params)

         @businesses = @yelp_results.businesses

        


      else 
        render  '/searches/index.html'
      end 
     end

      # @users = User.all
       @hash = [{ lat: 43, lng: 3.5}]

       # Gmaps4rails.build_markers(@business) do |business, marker|
       #    marker.lat 34.0500
       #    marker.lng 118.2500
       #    marker.infowindow "test"
      end
end
