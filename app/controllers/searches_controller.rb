class SearchesController < ApplicationController

    def index

      @keywords = params[:keywords].to_s
      @location = params[:location].to_s
      @limit = params[:limit] 

      # if params[:limit] == nil
      #   @limit = 
      # end
 

      if @keywords.strip != ''

        @keywords + " study spot" 

      @location = "Los Angeles" unless @location.strip != ''
        @params = { 
           term: @keywords,
           limit: 10
         }
         @yelp_results = Yelp.client.search(@location, @params)

         @businesses = @yelp_results.businesses


        # Google Map Function

        @hash = []

        @businesses. each do |business|

          @map_marker= Hash[:lat=> business.location.coordinate.latitude, :lng=> business.location.coordinate.longitude, :infowindow=> business.name ]
          @hash.push(@map_marker)
        end

      else 
        render  '/searches/index.html'
      end 
 
    end
end
