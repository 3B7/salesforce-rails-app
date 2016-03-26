class WelcomeController < ApplicationController
  # before_filter :authenticate, :if => lambda { Rails.env.production? }
  before_filter :require_authorized_user, :only => :news

  def index
    top_stories =  NyTimes::MostPopularApi.new
    response = top_stories.fetch
    @results = response['results'].sample(2) ## chances are the same story could be most shared story for a while

  end

  def news
    top_stories =  NyTimes::TopStoriesApi.new
    response = top_stories.fetch
    @results = response['results']
  end

  # def letsencrypt
  #   render text:
  # end

end