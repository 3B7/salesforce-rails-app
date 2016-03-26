require 'spec_helper'

describe "Google::Map API" do

  before(:each){
    @origin = "1000 Spring Street, Paso Robles, CA 93446"
    @destination = "450 Hilgard Avenue"
    @time = Time.now + 1.day
  }

  it "returns success status code" do
    g = Google::Map.new(@origin, @destination, @time.to_i)
    g.directions.response.kind_of?(Net::HTTPSuccess).should be_true
  end

  it "returns distance traveled" do
    g = Google::Map.new(@origin, @destination, @time.to_i)
    g.directions['routes'][0]['legs'][0]['distance']['text'].split(' ')[0].should_not be_empty
  end

  it "returns duration in traffic" do
    g = Google::Map.new(@origin, @destination, @time.to_i)
    g.directions['routes'][0]['legs'][0]['duration_in_traffic']['value'].present?.should be_true
  end

  it "returns an error if departure time is in the past" do
    @old_time = Time.now - 1.day
    g = Google::Map.new(@origin, @destination, @old_time.to_i)
    byebug
    g.directions['error_message'].should_not be_empty
  end

end