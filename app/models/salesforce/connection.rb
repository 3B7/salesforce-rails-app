module Salesforce
  module Connection # RESTFORCE

    def self.authenticated_client
      @client = Restforce.new(
        :username       => ENV['USERNAME'],
        :password       => ENV['PASSWORD'],
        :api_version    => ENV['API_VERSION'],
        :client_id      => ENV['CLIENT_ID'],
        :client_secret  => ENV['CLIENT_SECRET']
      )
      return @client
    end

    def self.api_requests_limits
      @limits = Salesforce::Connection.authenticated_client.limits
      return @limits
    end

  end
end