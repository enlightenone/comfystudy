class SearchesController < ApplicationController

    def index
    
      # search field params values
      @keywords = params[:keywords].to_s
      @location = params[:location].to_s

      # set wifi parameter for Yelp API search
      if params[:wifi].to_s == "yes"
        @keywords += " free wifi"
      end

      # set categories parameter for Yelp API search
      if params[:libraries] == nil && params[:college] == nil && params[:cafes] == nil 
         @category_string ='libraries,cafes,collegeuniv'
      else 
         @category_array = []
         @category_string = @category_array.push("cafes").join(',') if params[:cafes] == "yes"
         @category_string = @category_array.push("libraries").join(',') if params[:libraries] == "yes"
         @category_string = @category_array.push("collegeuniv").join(',') if params[:college] == "yes"
      end 


        # set sort keys
        @sortkey = 0 if params[:sort] == nil
        @sortkey = 0 if params[:sort] == "0"
        @sortkey = 1 if params[:sort] == "1"


      if @keywords.strip != ''

        @keywords += " study spot" 

      @location = "Los Angeles" unless @location.strip != ''
        @params = { 
           term: @keywords,
           limit: 10,
           category_filter: @category_string,
           sort: @sortkey
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
