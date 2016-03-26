class DistanceTraveled
  
  def self.compute_distance(opportunities)
    @client = Salesforce::Connection.authenticated_client
    
    opportunities.each do |opp|
      if (opp.Inspector__r.nil?) || (opp.Street__r.nil?)
        @missing_fields = [] << opp.Name
        Lita::Asimo.message("The following opportunities are missing either an address or inspector information: #{@missing_address.join(', ')} ") if !@missing_fields.empty?
      else
        origin = '' << opp.Street__r.Name + ", " + opp.City__c + ", " + opp.State__c + ", " + opp.Zip__c
        destination = '' << opp.Inspector__r.Address__c + ", " + opp.Inspector__r.City__c + ", " + opp.Inspector__r.State__c + ", " + opp.Inspector__r.Zip__c
        
        @g = Google::Map.new(origin,destination,Time.parse(opp.Inspection_Time_del__c).to_i)

        if @g.directions['error_message'].present?
          Lita::Asimo.message("Error calculation distance for Opportutnity #{opp.Name}: #{@g.directions['error_message']}")
          return false
        end

        @client.update('Opportunity', Id: "#{opp.Id}", Mileage__c: @g.distance_traveled, Time_Elapsed__c: "#{@g.duration_in_traffic}")
        
        @successly_updated = [] << opp.Name
        Lita::Asimo.message("The following opportunities were updated succesfully: #{@successly_updated.join(', ')}") if !@successly_updated.empty?
      end
    end
    
  end
end