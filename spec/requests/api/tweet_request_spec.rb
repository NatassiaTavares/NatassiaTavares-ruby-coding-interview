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

    xcontext 'With invalid parameters' do
      let(:user1) { create(:user)}

      context 'When the body is too long' do
        let(:invalid_body) {  }

        it 'returns an error response' do

        end

        it 'does not create a new tweet' do

        end
      end

      context 'When the tweet might be a duplicate' do

      end
    end
  end
end
