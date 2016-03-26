class UsersController < ApplicationController
  before_filter :require_authorized_user, :only => :show
  before_filter :fetch_client

  def show
    @producers = @client.query("
      SELECT Vertical__c, Subsidiary_trigger_list__c, Address__c, City__c, State__c, Zip__c
      From Producers__c WHERE Id = '#{current_user.salesforce_producer_id}'
    ")
  end

  def fetch_producer_id
    @producer = @client.query("
      SELECT Id FROM Producers__c WHERE Email__c = '#{params["email"]}'
    ")

    if @producer.first.Id.present?
      u = User.find_by_id(current_user.id)
      u.update_attributes(:salesforce_producer_id => @producer.first.Id.to_s)
      @success = true
    else
      Lita::Asimo.message("Error: A user with the email " + params["email"] + " was not found in Salesforce. Please create him so the user can view his opportunities on the dash.")
      @success = false
    end

    respond_to do |wants|
      wants.js
    end
  end

end