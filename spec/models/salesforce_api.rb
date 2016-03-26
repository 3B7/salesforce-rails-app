require 'spec_helper'

describe "ApiCall::SalesforceApi" do
  before(:each){ @salesforce_api = SalesforceApi.new }

  it "should have a type field equal to subclass" do
    @salesforce_api.type == @salesforce_api.class.to_s
  end

end