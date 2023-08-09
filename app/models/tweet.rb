class Tweet < ApplicationRecord
  belongs_to :user

  validates :body, length: {minimum: 0, maximum: 180}, allow_blank: false
  validates_presence_of :user, :body
  validate :validates_daily_uniqueness

  def validates_daily_uniqueness
    dupe_tweet = Tweet.where(user: user).where(created_at: 1.day.ago..).where(body: body)
    errors.add(:body, "duplicated tweet from user in 24 hours") unless dupe_tweet.blank?
  end
end
