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
end
