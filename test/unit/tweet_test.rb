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
      t.tweeted_text = "I LOVE #organic food#2012 and #fitness and yoga!"
    end

    assert_equal("Fitness, Food, Yoga", tweet.suggested_categories)
    #assert_equal("Yoga", tweet.suggested_categories)
    #assert_equal("Food", tweet.suggested_categories)
    #.array.include?
  end

  #########################################################

  def test_setting_categories_from_a_string
    tweet = Tweet.new
    cat = Category.where(title: "Food").first
    assert(cat)

    tweet.categories << cat
    assert_equal(1, tweet.categories.size)

    tweet.categories_as_string = "Food, Friends"
    #assert_equal("Food, Friends", tweet.categories_as_string)
    assert_equal(2, tweet.categories.size)
    assert_equal(%w(Food Friends),tweet.categories.map(&:title).sort)

  end
end


