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


          @latitude = @businesses[0].location.coordinate.latitude

        # Google Map Function

        @hash = []

        @businesses. each do |business|

          @map_marker= Hash[:lat=> business.location.coordinate.latitude, :lng=> business.location.coordinate.longitude, :infowindow=> business.name ]
          @hash.push(@map_marker)
        end

      else 
        render  '/searches/index.html'
      end 
    

       # @user =[{ lat: 40, lng: -80, name: 'Foo', infowindow: "I'm Foo" },
       # { lat: 45, lng: -90, name: 'Bar', infowindow: "I'm Bar" },
       # { lat: 50, lng: -85, name: 'Baz', infowindow: "I'm Baz" }

        # @users = {"latitude"=> 40, "longitude"=> -80, "name"=> "Foo"}

      # @users = [{"latitude"=> 40, "longitude"=> -80, "name"=> "Foo"},
      # {"latitude"=> 45, "longitude"=> -90, "name"=> "Barß"},
      # {"latitude"=> 50, "longitude"=> -84, "name"=>  "Baz"}
      #  ]
    

      # # @users = User.all
      #  @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      #     marker.lat  40
      #     marker.lng  -80
      #     marker.infowindow  "foo"
      # end

       # @hash = [{:lat=>40, :lng=>-80, :infowindow=>"foo"}, 
       #          {:lat=>45, :lng=>-90, :infowindow=>"bar"}, 
       #          {:lat=>50, :lng=>-85, :infowindow=>"baz"}]
    end
end
