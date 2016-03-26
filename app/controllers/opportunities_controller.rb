class OpportunitiesController < ApplicationController
  include ActionView::Helpers::NumberHelper
    helper_method :current_user
  
  before_filter :require_authorized_user
  before_filter :require_authorized_salesforce_user
  before_filter :fetch_client

  def index
    @opportunities = @client.query("
      SELECT Id, Street__r.Name, City__c, State__c, Zip__c, Start_Date_del__c, Due_Date_del__c, Amount, Appraiser__r.Name, Inspector__r.Name, StageName, 
      Inspector__r.Email__c, Appraiser__r.Email__c 
      FROM Opportunity 
        WHERE 
        Appraiser__c = '#{current_user.salesforce_producer_id}' OR
        Inspector__c = '#{current_user.salesforce_producer_id}' OR
        Reviewer__c = '#{current_user.salesforce_producer_id}'
    ")

    @teammates_opps = @client.query("
      SELECT Id, Street__r.Name, City__c, State__c, Zip__c, Start_Date_del__c, Due_Date_del__c, Amount, Appraiser__r.Name, Inspector__r.Name, StageName
      FROM Opportunity 
      WHERE StageName = 'Review' OR StageName = 'In Progress' OR StageName = 'On Hold'
    ")
  end

  def show
    @opp = @client.query("
      Select Name, Account.Name, Type, Subsidiary__r.Name, dev_brand_assignment__c, 
      Owner.Name, StageName, Amount, job_property_assignments_trigger_list__c,

      Street__r.Name, City__c, County__c, State__c, Zip__c,
      Portfolio__c, Proposed_Existing__c, of_opportunities__c, 

      Start_Date_del__c, Due_Date_del__c, Inspection_Time_del__c, Inspector__r.Address__c, Inspector__r.City__c, Inspector__r.State__c, Inspector__r.Zip__c,
      Appraiser__r.Name, Inspector__r.Name, Reviewer__r.Name,

      Zoning__c, Demo__c, Fema__c, NDC__c, AFC__c, Tax__c, Geo_Tracker__c, Alquist_Priolo__c,

      CreatedBy.Name, CreatedDate, LastModifiedBy.Name, LastModifiedDate
      
      From Opportunity
      where Id = '#{params[:id]}'
    ")

    @contact_role = @client.query("
      SELECT Contact.Name, Contact.Account.Name, Contact.Email, Contact.Phone, Role, IsPrimary
      FROM OpportunityContactRole
      WHERE OpportunityId = '#{params[:id]}'
    ")

    # @job_property_assignments = @client.query("
    #   SELECT Name, Job_Property_Tag__r.Name 
    #   From Job_Property_Assignment__c 
    #   WHERE Opportunity__r.Id = '#{params[:id]}'
    # ")

    # @brands = @client.query("
    #   SELECT Brand__r.Name FROM Brand_Assignment__c WHERE Opportunity__r.Id = '#{params[:id]}'
    # ")
  end

end