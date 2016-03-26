module NyTimes
  class TopStoriesApi
    include HTTParty
      base_uri "http://api.nytimes.com/"

      def initialize;end

      def fetch
        self.class.get("/svc/topstories/v1/home.json?api-key=#{ENV['NYTIMES_TOP_STORIES']}")
      end    

  end
end