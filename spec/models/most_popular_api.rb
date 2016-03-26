require 'spec_helper'

describe "NyTimes::MostPopularApi" do

  it "returns a success status code" do
    @popular =  NyTimes::MostPopularApi.new
    @popular.fetch.response.kind_of?(Net::HTTPSuccess).should be_true
  end

  it "return results/articles" do
    @popular =  NyTimes::MostPopularApi.new
    @popular.fetch['results'].present?.should be_true
  end
  
end