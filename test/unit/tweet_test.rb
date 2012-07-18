require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    %w(Food Boulder\Tech Fitness Friends Inspirational Yoga).each do |title|
      Category.create!(title: title)
    end
  end

  test("suggested categories works correctly") do
    tweet = Tweet.new do |t|
      t.tweeted_text = "I love organic food and fitness and yoga"
    end

    assert_equal("Fitness, Food, Yoga", tweet.suggested_categories)
  end
end

