class NotesController < ApplicationController

  before_filter(:fetch_tweet)
  before_filter(:fetch_note, except: [:index, :new, :create])

  def index
    @notes = @tweet.notes.order('created_at desc')
    respond_with(@tweet, @notes, location: tweet_url(@tweet))
  end

  def show
    # @note = @tweet.notes.find(params[:id])
    respond_with(@tweet, @note, location: tweet_url(@tweet))
  end

  def new
    @note = @tweet.notes.build
    respond_with(@tweet, @note)
  end

  def create
    @note = @tweet.notes.create(params[:note])
    respond_with(@tweet, @note)
  end

  def edit
    # @note = @tweet.notes.find(params[:id])
    respond_with(@tweet, @note)
  end

  def update
    # @note = @tweet.notes.find(params[:id])
    @note.update_attributes(params[:note])
    respond_with(@tweet, @note)
  end

  def destroy
    # @note = @tweet.notes.find(params[:id])
    @note.destroy
    respond_with(@tweet, @note)
  end

  #########################################################################
  private

  def fetch_tweet
    @tweet = current_user.tweets.find(params[:tweet_id])
  end

  def fetch_note
    @note = @tweet.notes.find(params[:id])
  end

end
