require 'spec_helper'

describe "NyTimes::TopStoriesApi" do

  it "returns a success status code" do
    @popular =  NyTimes::TopStoriesApi.new
    @popular.fetch.response.kind_of?(Net::HTTPSuccess).should be_true
  end

  it "return results/articles" do
    @popular =  NyTimes::TopStoriesApi.new
    @popular.fetch['results'].present?.should be_true
  end
  
end