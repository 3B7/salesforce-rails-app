class SalesforceApi < ApiCall
  
  def self.build_and_save!
    SalesforceApi.create(:max_calls => Salesforce::Connection.api_requests_limits.DailyApiRequests.Max, 
                         :remaining_calls => Salesforce::Connection.api_requests_limits.DailyApiRequests.Remaining)
  end

  after_save :determine_used_calls

  private

    def determine_used_calls
      update_column(:used_calls, self.max_calls - self.remaining_calls)
    end

end