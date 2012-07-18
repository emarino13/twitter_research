class Tweet < ActiveRecord::Base
  attr_accessible(:twitter_user, :tweeted_text, :tweeted_at, :user_id)

  validates(:twitter_user, :presence =>true)
  validates(:tweeted_text, :presence =>true)
  validates(:tweeted_at, :presence => true)
  validates(:user_id, :presence => true)

  belongs_to(:user)
  has_and_belongs_to_many(:categories)

  def suggested_categories
    categories = Category.all.map(&:title).map(&:downcase)
    tweet = tweeted_text.gsub(/#/, '').downcase.split.sort
    same = tweet & categories
    same.map(&:capitalize).sort.join(', ')
    end

  end

    #String#split
    #String#downcase
    #text = tweeted_text.gsub(/#/, '')
    #titles = Category.all.map(&:title).map
    #titles.include?(word)

# def suggested_categories
#words = tweeted_text.gsub(/#/, '').split(/\s+/)
#categories = Catgory.limit(30).all

#words.inject([]) do |collector, word|
#match = categories.detect {|c| c.title_match?(word)}
#collector << match.title if match
#collector
#end.sort.join(',')
#end
#end

# class Category < ActiveRecord::Base



#def title_match?(other)
#title.downcase = x

