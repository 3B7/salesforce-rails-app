module Salesforce
  class Opportunity

    def self.todays_inspections
      @client = Salesforce::Connection.authenticated_client
    
      @opps = @client.query("
        SELECT Id, Name, Inspection_Time_del__c,
        Inspector__r.Address__c, Inspector__r.City__c, Inspector__r.State__c, Inspector__r.Zip__c,
        Street__r.Name, City__c, State__c, Zip__c
        FROM Opportunity Where Inspection_Time_del__c = TODAY
      ")

      if @opps.first.nil?
        Lita::Asimo.message("There were no scheduled inspections today. All good!")
      else
        DistanceTraveled.compute_distance(@opps)
      end
    end

  end
end