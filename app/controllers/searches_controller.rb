class SearchesController < ApplicationController

    def index
    
      # search field params values
      @keywords = params[:keywords].to_s
      @location = params[:location].to_s


      if params[:wifi].to_s == "yes"
        @keywords += " free wifi"
      end

      # if (params[:libraries] == nil && params[:college] == nil && params[:college] == nil) ||
      #    (params[:libraries] == "yes" && params[:college] == "yes" && params[:college] == "yes")

      #    @category_string ='libraries,cafes,collegeuniv'
      # else
      #    @category_array = []

      #    @category_string = @category_array.

      # end 


      if @keywords.strip != ''

        @keywords += " study spot" 

      @location = "Los Angeles" unless @location.strip != ''
        @params = { 
           term: @keywords,
           limit: 20,
           category_filter: @category_string
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
