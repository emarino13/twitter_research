class Tweet < ActiveRecord::Base
  attr_accessible(:twitter_user, :tweeted_text, :tweeted_at, :categories_as_string)
  #allows mass assignment. never put a foriegn key in here.
  #only what you want a user to be able to use

  validates(:twitter_user, :presence =>true)
  validates(:tweeted_text, :presence =>true)
  validates(:tweeted_at, :presence => true)
  #validates(:user_id, :presence => true)

  scope(:with_notes, includes(:notes).order('notes.created_at desc'))
  belongs_to(:user)
  has_many(:notes)
  has_and_belongs_to_many(:categories)

  def suggested_categories
    categories = Category.all.map(&:title).map(&:downcase)
    tweet = tweeted_text.gsub(/[^\w\s]/, ' ').downcase.split.sort
    same = tweet & categories
    same.map(&:capitalize).sort.join(', ')
  end

  ###########################################
#Returns a comma separated string of the current category titles.
  def categories_as_string
    categories.map(&:title).sort.join(', ')

  end
  ##################################################
  #Given a comma separated string of category titles, reset the categories
  #for this tweet to the categories in the string.

  def categories_as_string=(new_categories)
    categories.clear

    new_categories.split(/\s*, \s*/).each do |title|
      cat = Category.where('LOWER(title) = ?', title.downcase).first
      categories << cat if !cat.nil?
      #if !cat.nil?
      # categories << cat

    end
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

