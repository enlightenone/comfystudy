class ClientsController < ApplicationController

  def index
    @params = { 
      term: 'study spot',
      limit: 3
    }
    @yelp_results = Yelp.client.search('91804', @params)

    @business = @yelp_results.businesses[0].name

    

  end
end
