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
       @hash = Gmaps4rails.build_markers(@users) do |user, marker|
          marker.lat user.latitude
          marker.lng user.longitude
          marker.infowindow user.description
          marker.picture({
            "url" => "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
            "width" => 32, 
            "height" => 32
            })
          marker.json({title: user.title })
      end
end
