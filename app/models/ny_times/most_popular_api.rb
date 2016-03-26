module NyTimes
  class MostPopularApi
    include HTTParty
      base_uri "http://api.nytimes.com/"

      def initialize;end

      def fetch
        self.class.get("/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=#{ENV['NYTIMES_MOST_POPULAR']}")
      end

  end
end