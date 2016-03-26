desc "This task fetches all the opportunities to be inspected today and computes travel dsitance"
task :distance_traveled => :environment do
  puts "Grabbing Opps"
  Salesforce::Opportunity.todays_inspections
  puts "FIN"
end

desc "This task logs Salesforce Api calls"
task :salesforce_api_logging => :environment do
  puts "Starting"
  SalesforceApi.build_and_save!
  puts "FIN"
end