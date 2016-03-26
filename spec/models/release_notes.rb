require 'spec_helper'

describe ReleaseNotes do
  before(:each) do
    @note = FactoryGirl.create(:release_notes)
  end

  it "belongs to a user" do
    should belong_to(:created_by)
  end

  it "should require a version number" do
    ReleaseNotes.new(:version_number => '').should_not be_valid
  end

  it "should require a body" do
    ReleaseNotes.new(:body => '').should_not be_valid
  end
end