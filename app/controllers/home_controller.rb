class HomeController < ApplicationController
  def index
    @tweets = Tweet.distinct(:user_id).order("created_at DESC").to_a.first(20)
  end
end
