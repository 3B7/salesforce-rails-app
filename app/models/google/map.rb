## DOCS -- https://developers.google.com/maps/documentation/directions/intro
## EXAMPLE OF JSON OUTPUT -- http://maps.googleapis.com/maps/api/directions/json?origin=montreal&destination=toronto&sensor=false

# g = Google::Map.new("1000 Spring Street, Paso Robles, CA 93446", "450 Hilgard Avenue", 1451030400)
# Departure Time: Time.parse("2015-12-25 00:00:00 -0800").to_i
# g.directions['routes'][0]['legs'][0]['duration_in_traffic']
#       =>  {"text"=>"3 hours 14 mins", "value"=>11643}  ** value indicates the duration in seconds.
## SEND value in seconds => minutes to Salesforce Opp.minutes_elapsed__c field 
## g.directions['routes'][0]['legs'][0]['distance']['text'] => Opp.miles_traveled__c field

module Google
  class Map
    include HTTParty
    base_uri 'https://maps.googleapis.com'

    attr_accessor :origin, :destination

     def initialize(origin, destination, departure_time)
      @options = { query: {origin: origin, 
                          destination: destination, 
                          departure_time: departure_time,
                          mode: 'driving',
                          key: ENV['G_MAP_SERVER_KEY']} }
    end

    def directions
      self.class.get("/maps/api/directions/json", @options)
    end

    def distance_traveled
      directions['routes'][0]['legs'][0]['distance']['text'].split(' ')[0].to_i
    end

    def duration_in_traffic
      # Per the Directions API -- value indicates the duration in seconds
      directions['routes'][0]['legs'][0]['duration_in_traffic']['value'] / 60 
    end
  end
end