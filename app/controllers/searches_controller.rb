class SearchesController < ApplicationController

    def index

      @keywords = params[:keywords].to_s

      if @keywords.to_s.strip != ''

        @params = { 
           term: @keywords ,
           limit: 2
         }
         @yelp_results = Yelp.client.search('91804', @params)

         @businesses = @yelp_results.businesses

      else 
        render  '/searches/index.html'
    end 

    # @params = { 
    #   term: 'study spot',
    #   limit: 3
    # }
    # @yelp_results = Yelp.client.search('San Francisco', @params)

    # @business = @yelp_results

    

  end
end
