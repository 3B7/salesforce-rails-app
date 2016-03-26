require 'spec_helper'

describe ApiCall do
  before(:each){ @api_call = ApiCall.new }

  it "should require max calls" do
    ApiCall.new(:max_calls => '').should_not be_valid
  end

  it "should require remaining calls" do
    ApiCall.new(:remaining_calls => '').should_not be_valid
  end

end