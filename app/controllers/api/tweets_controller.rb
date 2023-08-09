module Api
  class TweetsController < ApplicationController
    skip_before_action :verify_authenticity_token

    TWEETS_PER_PAGE = 50

    def create
      return head :bad_request if params[:body].blank? || params[:user_id].blank?

      @tweet = Tweet.create!(
          user_id: params[:user_id],
          body: params[:body]
        )

      render json: @tweet
    end

    def index
      @tweets = Tweet.order("created_at ASC").limit(TWEETS_PER_PAGE).offset(offset)

      render json: @tweets
    end

    private

    def page_params
      params.permit(:page).merge(per_page: TWEETS_PER_PAGE)
    end

    def page
      params[:page]
    end

    def offset
      return 0 if !page || page == 1

      page * (page.to_i - 1)
    end
  end
end