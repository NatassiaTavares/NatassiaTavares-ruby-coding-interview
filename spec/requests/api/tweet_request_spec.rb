require 'rails_helper'

RSpec.describe "API Tweets", type: :request do
  describe "#create" do
    let(:response_body) { JSON.parse(response.body) }

    context 'with valid parameters' do
      let(:user1) { create(:user)}
      let(:valid_body) { 'This is a valid tweet' }

      it 'returns a successful response' do
        post api_tweets_path(user_id: user1.id, body: valid_body)

        expect(response).to have_http_status(:success)
      end

      it 'creates a new tweet' do
        expect {
          post api_tweets_path(user_id: user1.id, body: valid_body)
        }.to change(Tweet, :count).by(1)
      end
    end

    context 'With invalid parameters' do
      let(:user1) { create(:user)}
         
      context 'When the body is too long' do
        let(:invalid_body) { "tweeet" * 40}

        it 'returns an error response' do
          post api_tweets_path(user_id: user1.id, body: invalid_body)

          expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'does not create a new tweet' do
          expect {
            post api_tweets_path(user_id: user1.id, body: invalid_body)
          }.to change(Tweet, :count).by(0)
        end
      end

      context 'When the tweet might be a duplicate' do
        let(:user1) { create(:user)}
        let(:valid_body) { 'This is a valid tweet' }
        let(:tweet) { create(:tweet, user: user1, body: valid_body) }

        it 'returns an error message' do
          puts tweet.body
          post api_tweets_path(user_id: user1.id, body: valid_body)

          expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'does not create a new tweet' do
          expect {
            post api_tweets_path(user_id: user1.id, body: valid_body)
          }.to change(Tweet, :count).by(0)
        end
      end
    end
  end
end
